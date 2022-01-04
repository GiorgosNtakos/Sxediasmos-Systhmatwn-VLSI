--Dhlwsh bibliothhkhs kai twn paketwn poy tha xrhsimopoihsoyme
LIBRARY IEEE; 
USE IEEE.std_logic_1164.all;

ENTITY mux IS
GENERIC(N: NATURAL :=8);
PORT (
-- Shma eisodoy poy lambanei mia akoloythia timwn.
	a:IN std_logic_vector(N-1 downto 0);
-- Shma eisodoy poy lambanei mia akoloythia timwn.
	sel:IN std_logic_vector(1 downto 0);
-- Shma eisodoy poy lambanei mia akoloythia timwn.
	b :IN std_logic_vector(N-1 downto 0);
-- Shma eijodoy poy lambanei mia akoloythia timwn. 

	c :IN STD_LOGIC_VECTOR(N-1 downto 0);
	
	d :IN STD_LOGIC_VECTOR(N-1 downto 0);
	
	x :OUT std_logic_vector(N-1 downto 0));
END mux;

--Dhlwsh arxitektonikhs
ARCHITECTURE behavioral OF mux IS
BEGIN
  --Ylopoihsh toy pinaka alhtheias
  --dld analoga me thn timh toy sel
  --pairnei kai antistoixh timh toy pinaka to shma ejodoy
	WITH (sel) SELECT
		x <= a WHEN "00",
			 b WHEN "01",
			 c WHEN "10",
			 d WHEN "11",
		    (OTHERS=>'Z') WHEN others;
	
END behavioral;