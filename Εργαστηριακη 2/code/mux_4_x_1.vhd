--Dhlwsh bibliothhkhs kai twn paketwn poy tha xrhsimopoihsoyme
LIBRARY IEEE; 
USE IEEE.std_logic_1164.all;

ENTITY mux_4_x_1 IS
GENERIC(N: NATURAL :=8);
PORT (
-- Shma eisodoy poy lambanei mia akoloythia timwn.
 a:IN std_logic_vector(N-1 downto 0);
 -- Shma eisodoy poy lambanei mia akoloythia timwn.
 sel:IN std_logic_vector(1 downto 0);
 -- Shma eisodoy poy lambanei mia akoloythia timwn.
 b :IN std_logic_vector(N-1 downto 0);
 -- Shma ejodoy poy lambanei mia akoloythia timwn. 
 x :OUT std_logic_vector(N-1 downto 0));
END mux_4_x_1;

--Dhlwsh arxitektonikhs
ARCHITECTURE behavioral OF mux_4_x_1 IS

BEGIN
  --Ylopoihsh toy pinaka alhtheias
  --dld analoga me thn timh toy sel
  --pairnei kai antistoixh timh toy pinaka to shma ejodoy
	x<= "00000000" WHEN sel = "00" ELSE
	a WHEN sel = "01" ELSE
	b WHEN sel = "10" ELSE
	"ZZZZZZZZ" WHEN sel = "11" ELSE
	(OTHERS => '-');
	
END behavioral;