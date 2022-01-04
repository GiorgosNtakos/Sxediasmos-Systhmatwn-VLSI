--Dhlwsh bibliothhkhs kai twn paketwn poy tha xrhsimopoihsoyme
LIBRARY IEEE; 
USE IEEE.std_logic_1164.all;

--Dhlwsh ontothtas
ENTITY full_adder IS
PORT
(
-- Shmata eisodoy poy lambanoun 0 h 1.
a,b,cin: IN BIT;
-- Shmata ejodoy poy lambanoun 0 h 1.
sum,cout: OUT BIT);
END full_adder;

--Dhlwsh arxitektonikhs
ARCHITECTURE dataflow OF full_adder IS
--sto parakatw mplok kwdika
--orizoyme thn leitourgia ths
--ontothtas me perigrafh rohs dedomenwn
BEGIN
sum <= a XOR b XOR cin;
cout <=(a AND b) OR (a AND cin) OR (b AND cin);
END dataflow;