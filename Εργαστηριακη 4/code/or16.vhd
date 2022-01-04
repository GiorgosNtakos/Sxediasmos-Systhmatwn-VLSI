
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY or16 IS
GENERIC(N: NATURAL :=16);
PORT(

 A :IN std_logic_vector(N-1 DOWNTO 0);
 
 B :IN std_logic_vector(N-1 DOWNTO 0);
 
 Y :OUT std_logic_vector(N-1 DOWNTO 0));
 END or16;
 
 ARCHITECTURE structural OF or16 IS
 BEGIN
 
 ORLoop: FOR i IN 0 TO N-1 GENERATE
 
 Y(i) <= A(i) OR B(i);
 
 END GENERATE ORLoop;
 END structural;