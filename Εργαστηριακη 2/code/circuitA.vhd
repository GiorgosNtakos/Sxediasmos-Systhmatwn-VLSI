--Dhlwsh bibliothhkhs kai twn paketwn poy tha xrhsimopoihsoyme
LIBRARY IEEE; 
USE IEEE.std_logic_1164.all;

--Dhlwsh ontothtas
ENTITY circuitA IS
PORT (
 -- Shma eisodoy poy lambanei ena bit.
 A : IN BIT;
 -- Shma eisodoy poy lambanei ena bit.
 B : IN BIT;
 -- Shma eisodo poy lambanei ena bit.
 C : IN BIT;
 -- Shma ejodo poy lambanei ena bit.
 Z : OUT BIT
);
END circuitA;

ARCHITECTURE behavioral OF  circuitA IS

BEGIN
--akoloythiakh ektelesh toy parakatw blok kwdika
PROCESS(A,B,C)

	BEGIN
	--ean isxuei mia apo tis dyo  h kai oi dyo
		IF ((A AND B) = '1' OR C = '1') THEN
	--tote these to shma ejodoy iso me '1'
			Z<='1';
		ELSE
	--Se opoiadhpote allh periptwsh these to shma
	--ejodoy iso me '0'
			Z<='0';
		END IF;
	END PROCESS;
END behavioral;