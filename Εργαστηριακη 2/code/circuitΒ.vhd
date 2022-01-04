--Dhlwsh bibliothhkhs kai twn paketwn poy tha xrhsimopoihsoyme
LIBRARY IEEE; 
USE IEEE.std_logic_1164.all;

--Dhlwsh ontothtas
ENTITY circuitB IS
PORT (
-- Shma eisodoy poy lambanei ena bit.
	A : IN BIT;
-- Shma eisodoy poy lambanei ena bit.
	B : IN BIT;
-- Shma eisodoy poy lambanei ena bit.
	C : IN BIT;
-- Shma ejodo poy lambanei ena bit.
	Z : OUT BIT
);
END circuitB;

--Dhlwsh arxitektonikhs
ARCHITECTURE structural OF  circuitB IS

--Klhsh toy stoixeio NOT_GATE kai dhlwsh eisodwn ejodwn
	COMPONENT NOT_GATE
		PORT(A : IN BIT; Y : OUT BIT);
	END COMPONENT;

--Klhsh toy stoixeio AND_GATE kai dhlwsh eisodwn ejodwn
	COMPONENT AND_GATE
		PORT(A,B : IN BIT; Y : OUT BIT);
	END COMPONENT;

--Klhsh toy stoixeio OR_GATE kai dhlwsh eisodwn ejodwn
	COMPONENT OR_GATE
		PORT(A,B : IN BIT; Y : OUT BIT);
	END COMPONENT;

--Dhlwsh proswrinwn metablhtwn(endiamesa shmata)
SIGNAL x1,x2,x3,x4 : BIT; 

--Dhmioyrgia toy kyklwmatos me bash thn eikona 4 ths anaforas
--Xtizoyme to kyklwma dhladh me endiamesa shmata kai eidh
--stoixeia ylikoy ta opoia exoyme sthn diathesh mas.

	BEGIN
		GATE_1 : NOT_GATE PORT MAP (C,x2);--C eisodos,x2 ejodos
		GATE_2 : AND_GATE PORT MAP (A,B,x1);--A,B eisodoi,x1 ejodos
		GATE_3 : AND_GATE PORT MAP (x1,x2,x3);--x1,x2 eisodoi,x3 ejodos
		GATE_4 : OR_GATE PORT MAP (x1,x3,x4);--x1,x3 eisodos,x4 ejodos
		GATE_5 : OR_GATE PORT MAP (C,x4,Z);--C,x4 eisodos,Z ejodos
	END structural;