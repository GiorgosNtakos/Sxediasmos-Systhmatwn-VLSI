--Dhlwsh bibliothhkhs kai twn paketwn poy tha xrhsimopoihsoyme
LIBRARY IEEE; 
USE IEEE.std_logic_1164.all;

--Dhlwsh ontothtas
ENTITY OR_GATE IS
PORT (
 -- Shma eisodoy poy lambanei ena bit.
 A : IN BIT;
 -- Shma eisodoy poy lambanei ena bit.
 B : IN BIT;
 -- Shma ejodo poy lambanei ena bit.
 Y : OUT BIT
);
END OR_GATE;

--Dhlwsh arxitektonikhs
ARCHITECTURE behavioral OF  OR_GATE IS

BEGIN
--logikh prajh OR
Y <= (A OR B);

END behavioral;