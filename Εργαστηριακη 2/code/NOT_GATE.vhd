--Dhlwsh bibliothhkhs kai twn paketwn poy tha xrhsimopoihsoyme
LIBRARY IEEE; 
USE IEEE.std_logic_1164.all;

--Dhlwsh ontothtas
ENTITY NOT_GATE IS
PORT (
 -- Shma eisodoy poy lambanei ena bit.
 A : IN BIT;
  -- Shma ejodoy poy lambanei ena bit.
 Y : OUT BIT
);
END NOT_GATE;

--Dhlwsh arxitektonikhs
ARCHITECTURE behavioral OF  NOT_GATE IS

BEGIN

--Logikh prajh NOT
Y <= not A;

END behavioral;