LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY mux IS
  GENERIC (N : NATURAL := 8);
  PORT (
    a   : IN  std_logic_vector(N-1 downto 0);
    b   : IN  std_logic_vector(N-1 downto 0);
    c   : IN  std_logic_vector(N-1 downto 0);
    d   : IN  std_logic_vector(N-1 downto 0);
    sel : IN  std_logic_vector(1 downto 0);
    x   : OUT std_logic_vector(N-1 downto 0)
  );
END mux;

ARCHITECTURE behavioral OF mux IS
BEGIN
  WITH sel SELECT
    x <= a WHEN "00",
         b WHEN "01",
         c WHEN "10",
         d WHEN "11",
         (OTHERS => '0') WHEN OTHERS;
END behavioral;
