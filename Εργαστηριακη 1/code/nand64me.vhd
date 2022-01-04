--Dhlwsh bibliothhkhs kai twn paketwn poy tha xrhsimopoihsoyme
LIBRARY IEEE; 
USE IEEE.std_logic_1164.all;

--Dhlwsh ontothtas
ENTITY nand64me IS
GENERIC(N: NATURAL :=64);
PORT (
 -- Shma eisodoy poy lambanei mia akoloythia timwn.
 inputA :IN std_logic_vector(0 to N-1);
  -- Shma eisodoy poy lambanei mia akoloythia timwn.
 inputB :IN std_logic_vector(0 to N-1);
 -- Shma eijodoy poy lambanei mia akoloythia timwn. 
 outputC :OUT std_logic_vector(0 to N-1));
END nand64me;

--Dhlwsh arxitektonikhs
ARCHITECTURE structural OF nand64me IS
BEGIN
 -- Broxos o opoios tha ektelestei 64 fores.
XORLoop: For i IN 0 TO 63 Generate 
--Se kathe epanalhpsh anathetoyme thn logikh prajh nand-
--sto shma ejodoy ths kathe epanalhpshs.
--Dhladh dhmioyrgoyme 64 diaforetikes pyles nand.
outputC(i) <= inputA(i) NAND inputB(i);   
 End Generate XORLoop; --Telos Broxoy
END structural; 