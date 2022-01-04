--Dhlwsh bibliothhkhs kai twn paketwn poy tha xrhsimopoihsoyme
LIBRARY IEEE; 
USE IEEE.std_logic_1164.all;

--Dhlwsh ontothtas
ENTITY logic_unit IS
PORT
(
-- Shmata eisodoy poy lambanoun mia akoloythia timwn.
a,b: IN STD_LOGIC_VECTOR(7 downto 0);
-- Shmata eijodoy poy lambanoun mia akoloythia timwn.
Cxor,Cand: OUT STD_LOGIC_VECTOR(7 downto 0));
END logic_unit;

--Dhlwsh arxitektonikhs
ARCHITECTURE dataflow OF logic_unit IS
--sto parakatw mplok kwdika
--orizoyme thn leitourgia ths
--ontothtas me perigrafh rohs dedomenwn
BEGIN
ForLoop: For i IN 0 TO 7 Generate 
--Se kathe epanalhpsh anathetoyme thn logikh prajh and & xor
--sta shmata ejodoy antistoixa ths kathe epanalhpshs.
--Dhladh dhmioyrgoyme 8 diaforetikes pyles and
--kai 8 diaforetikes pyles xor
Cand(i) <= a(i) AND b(i);
Cxor(i) <= a(i) XOR b(i);
 End Generate ForLoop; --Telos Broxoy
END dataflow;