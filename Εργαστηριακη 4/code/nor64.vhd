
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY nor64 IS
GENERIC(N: NATURAL :=64);
PORT(

 A :IN std_logic_vector(N-1 DOWNTO 0);
 
 B :IN std_logic_vector(N-1 DOWNTO 0);
 
 Y :OUT std_logic_vector(N-1 DOWNTO 0));
 END nor64;
 
 ARCHITECTURE structural OF nor64 IS
 BEGIN
 
 NORLoop: FOR i IN 0 TO N-1 GENERATE
 
 Y(i) <= A(i) NOR B(i);
 
 END GENERATE NORLoop;
 END structural;