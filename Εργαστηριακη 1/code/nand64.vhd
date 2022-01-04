--Dhlwsh bibliothhkhs kai twn paketwn poy tha xrhsimopoihsoyme
LIBRARY IEEE; 
USE IEEE.std_logic_1164.all;

--Dhlwsh ontothtas
ENTITY nand64 IS
PORT (
 -- Shma eisodoy poy lambanei mia akoloythia timwn.
 inputA :IN std_logic_vector(63 downto 0);
  -- Shma eisodoy poy lambanei mia akoloythia timwn.
 inputB :IN std_logic_vector(63 downto 0);
 -- Shma eijodoy poy lambanei mia akoloythia timwn. 
 outputC :OUT std_logic_vector(63 downto 0));
END nand64;

--Dhlwsh arxitektonikhs
ARCHITECTURE structural OF nand64 IS
BEGIN
 -- Broxos o opoios tha ektelestei 64 fores.
XORLoop: For i IN 0 TO 63 Generate 
--Se kathe epanalhpsh anathetoyme thn logikh prajh nand-
--sto shma ejodoy ths kathe epanalhpshs.
--Dhladh dhmioyrgoyme 64 diaforetikes pyles nand.
outputC(i) <= inputA(i) NAND inputB(i);   
 End Generate XORLoop; --Telos Broxoy
END structural; 