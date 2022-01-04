LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY Nand1 IS
PORT (inputA :IN std_logic;
 inputB :IN std_logic;
 outputC :OUT std_logic);
END Nand1;

ARCHITECTURE structural OF Nand1 IS
  BEGIN
outputC <= inputA NAND inputB;
END structural;