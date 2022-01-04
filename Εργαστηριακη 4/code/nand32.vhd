
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY nand32 IS
GENERIC(N: NATURAL :=32);
PORT(

 A :IN std_logic_vector(N-1 DOWNTO 0);
 
 B :IN std_logic_vector(N-1 DOWNTO 0);
 
 Y :OUT std_logic_vector(N-1 DOWNTO 0));
 END nand32;
 
 ARCHITECTURE structural OF nand32 IS
 BEGIN
 
 NANDLoop: For i IN 0 TO N-1 Generate
 
 Y(i) <= A(i) NAND B(i);
 
 END Generate NANDLoop;
 END structural;