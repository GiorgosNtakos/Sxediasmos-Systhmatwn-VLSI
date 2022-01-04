--Dhlwsh bibliothhkhs kai twn paketwn poy tha xrhsimopoihsoyme
LIBRARY IEEE; 
USE IEEE.std_logic_1164.all;

--Dhlwsh ontothtas
ENTITY AND_GATE IS
PORT (
 -- Shma eisodoy poy lambanei ena bit.
 A : IN BIT;
 -- Shma eisodoy poy lambanei ena bit.
 B : IN BIT;
  -- Shma ejodo poy lambanei ena bit.
 Y : OUT BIT
 );
END AND_GATE;

--Dhlwsh arxitektonikhs
ARCHITECTURE behavioral OF  AND_GATE IS

BEGIN
--Logikh prajh AND
Y <= (A AND B);

END behavioral;