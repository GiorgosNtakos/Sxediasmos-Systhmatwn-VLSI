library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_RAM_sync is
end entity;

architecture tb of tb_RAM_sync is
  constant A : integer := 5;
  constant D : integer := 8;

  signal clk  : std_logic := '0';
  signal rst : std_logic := '0';
  signal wr   : std_logic := '0';
  signal addr : std_logic_vector(A-1 downto 0) := (others => '0');
  signal din  : std_logic_vector(D-1 downto 0) := (others => '0');
  signal dout : std_logic_vector(D-1 downto 0);

  constant CLK_PERIOD : time := 10 ns; -- 100 MHz
begin
  -- clock
  clk <= not clk after CLK_PERIOD/2;

  -- UUT
  uut: entity work.RAM_sync
    generic map (A => A, D => D)
    port map (
      clk  => clk,
      rst  => rst,
      wr   => wr,
      addr => addr,
      din  => din,
      dout => dout
    );

  stim: process
  begin
    --------------------------------------------------------------------------
    -- Αρχικά: αφήνουμε 2-3 clocks να “σταθεροποιήσει” την έξοδο
    --------------------------------------------------------------------------
   -- Apply reset for 2 clock cycles
	rst  <= '1';
	wr   <= '0';
	addr <= (others => '0');
	din  <= (others => '0');

	wait until rising_edge(clk);
	wait until rising_edge(clk);

	rst <= '0';

	-- wait one more cycle so outputs settle after reset
	wait until rising_edge(clk);
	wait for 1 ns;

	assert dout = x"01"
  	report "INIT ERROR: Expected 0x01 at addr 0 after reset"
  	severity error;

    --------------------------------------------------------------------------
    -- WRITE: 0x05 @ 0x04
    --------------------------------------------------------------------------
    addr <= std_logic_vector(to_unsigned(4, A));
    din  <= x"05";
    wr   <= '1';
    wait until rising_edge(clk);  -- γράφει εδώ
    wait for 1 ns;

    --------------------------------------------------------------------------
    -- READ: 0x04 -> expect 0x05 (σύγχρονη ανάγνωση: valid μετά το edge)
    --------------------------------------------------------------------------
    wr   <= '0';
    addr <= std_logic_vector(to_unsigned(4, A));
    wait until rising_edge(clk);  -- διαβάζει εδώ
    wait for 1 ns;

    assert dout = x"05"
      report "READ ERROR: Expected 0x05 at addr 0x04"
      severity error;

    --------------------------------------------------------------------------
    -- WRITE: 0xA5 @ 0x07
    --------------------------------------------------------------------------
    addr <= std_logic_vector(to_unsigned(7, A));
    din  <= x"A5";
    wr   <= '1';
    wait until rising_edge(clk);
    wait for 1 ns;

    --------------------------------------------------------------------------
    -- READ: 0x07 -> expect 0xA5
    --------------------------------------------------------------------------
    wr   <= '0';
    addr <= std_logic_vector(to_unsigned(7, A));
    wait until rising_edge(clk);
    wait for 1 ns;

    assert dout = x"A5"
      report "READ ERROR: Expected 0xA5 at addr 0x07"
      severity error;

    report "TB PASSED: RAM_sync works correctly." severity note;
    wait;
  end process;
end architecture;
