--Dhlwsh bibliothhkhs kai twn paketwn poy tha xrhsimopoihsoyme
LIBRARY IEEE; 
USE IEEE.std_logic_1164.all;

ENTITY second_mux_2_x_1 IS
GENERIC(N: NATURAL :=8);
PORT (
-- Shma eisodoy poy lambanei mia akoloythia timwn.
	a:IN std_logic_vector(N-1 downto 0);
-- Shma eisodoy poy lambanei mia akoloythia timwn.
	sel:IN std_logic_vector(1 downto 0);
-- Shma eisodoy poy lambanei mia akoloythia timwn.
	b :IN std_logic_vector(N-1 downto 0);
-- Shma eijodoy poy lambanei mia akoloythia timwn. 
	x :OUT std_logic_vector(N-1 downto 0));
END second_mux_2_x_1;

--Dhlwsh arxitektonikhs
ARCHITECTURE behavioral OF second_mux_2_x_1 IS
BEGIN
  --Ylopoihsh toy pinaka alhtheias
  --dld analoga me thn timh toy sel
  --pairnei kai antistoixh timh toy pinaka to shma ejodoy
	WITH (sel) SELECT
		x <= "00000000" WHEN "00",
		a WHEN "01",
		b WHEN "10",
		"ZZZZZZZZ" WHEN "11",
		"--------" WHEN others;
	
END behavioral;