library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RAM_sync is
  generic (
    A : integer := 5;  -- address bits (32 locations)
    D : integer := 8   -- data bits (8-bit word)
  );
  port (
    clk  : in  std_logic;
    rst  : in  std_logic; -- synchronous reset
    wr   : in  std_logic; -- 1=write, 0=read
    addr : in  std_logic_vector(A-1 downto 0);
    din  : in  std_logic_vector(D-1 downto 0);
    dout : out std_logic_vector(D-1 downto 0)
  );
end entity;

architecture rtl of RAM_sync is
  type ram_t is array (0 to 2**A - 1) of std_logic_vector(D-1 downto 0);
  signal ram : ram_t;

  signal addr_i : integer range 0 to 2**A - 1;
begin
  addr_i <= to_integer(unsigned(addr));

  -- Σύγχρονη εγγραφή + σύγχρονη ανάγνωση (registered output)
 process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        -- init
        ram <= (others => (others => '0'));
        ram(0) <= "00000001";
        ram(1) <= "00000010";
        ram(2) <= "00000011";
        ram(3) <= "00000100";
        dout   <= (others => '0'); 
      else
        if wr = '1' then
          ram(addr_i) <= din;
        end if;

        -- synchronous read (registered output)
        dout <= ram(addr_i);
      end if;
    end if;
  end process;

end architecture;
