
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY xor8 IS
GENERIC(N: NATURAL :=8);
PORT(

 A :IN std_logic_vector(N-1 DOWNTO 0);
 
 B :IN std_logic_vector(N-1 DOWNTO 0);
 
 Y :OUT std_logic_vector(N-1 DOWNTO 0));
 END xor8;
 
 ARCHITECTURE structural OF xor8 IS
 BEGIN
 
 XORLoop: For i IN 0 TO N-1 Generate
 
 Y(i) <= A(i) XOR B(i);
 
 END Generate XORLoop;
 END structural;