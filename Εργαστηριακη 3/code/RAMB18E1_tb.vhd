library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_ram32x8_bram_sdp is
end entity;

architecture tb of tb_ram32x8_bram_sdp is
  -- UUT signals
  signal clk  : std_logic := '0';
  signal wr   : std_logic := '0'; -- 1=write, 0=read
  signal addr : std_logic_vector(4 downto 0) := (others => '0');
  signal din  : std_logic_vector(7 downto 0) := (others => '0');
  signal dout : std_logic_vector(7 downto 0);

  constant CLK_PERIOD : time := 10 ns; -- 100 MHz
begin
  -- Clock generator
  clk <= not clk after CLK_PERIOD/2;

  -- Instantiate the BRAM wrapper (Unit Under Test)
  uut: entity work.ram32x8_bram_sdp
    port map (
      clk  => clk,
      wr   => wr,
      addr => addr,
      din  => din,
      dout => dout
    );

  -- Stimulus process (vectors like B1)
  stim_proc: process
  begin
    -- "initialization/idle" period like your B1 (signals stable but memory content undefined)
    -- In BRAM there isn't guaranteed init unless you use INIT generics; so we just wait.
    wr   <= '0';
    addr <= (others => '0');
    din  <= (others => '0');
    wait for 100 ns;

    --------------------------------------------------------------------------
    -- WRITE: DIN = 05h to ADDR = 04h (wr=1)
    --------------------------------------------------------------------------
    addr <= std_logic_vector(to_unsigned(4, addr'length));  -- 0x04
    din  <= x"05";
    wr   <= '1';

    -- Write happens on rising edge of clk while wr=1
    wait until rising_edge(clk);
    -- Keep signals stable for a bit after the edge (good practice)
    wait for 1 ns;

    --------------------------------------------------------------------------
    -- READ: from ADDR = 04h (wr=0) => expect DOUT = 05h after read clock edge
    --------------------------------------------------------------------------
    wr   <= '0';
    addr <= std_logic_vector(to_unsigned(4, addr'length));

    -- Read happens on rising edge of clk while wr=0 (RDEN=1 internally)
    wait until rising_edge(clk);
    wait for 1 ns;

    -- Assert expected output (synchronous read)
    assert dout = x"05"
      report "ERROR: Read data mismatch. Expected 0x05 at addr 0x04."
      severity error;

    --------------------------------------------------------------------------
    -- Optional extra check: write another value, read it back (keeps it robust)
    --------------------------------------------------------------------------
    addr <= std_logic_vector(to_unsigned(7, addr'length)); -- 0x07
    din  <= x"A5";
    wr   <= '1';
    wait until rising_edge(clk);
    wait for 1 ns;

    wr   <= '0';
    addr <= std_logic_vector(to_unsigned(7, addr'length));
    wait until rising_edge(clk);
    wait for 1 ns;

    assert dout = x"A5"
      report "ERROR: Read data mismatch. Expected 0xA5 at addr 0x07."
      severity error;

    report "TB PASSED: BRAM 32x8 SDP wrapper behaves as expected." severity note;

    wait; -- end simulation
  end process;

end architecture;
