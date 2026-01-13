LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

USE work.mult_3x3_pack.all;

ENTITY MatrixMultiplier3X3 IS

GENERIC(N : NATURAL := 3);

PORT(
 matrix_a : IN matrix_in(0 TO N-1 , 0 TO N-1);
 matrix_b : IN matrix_in(0 TO N-1 , 0 TO N-1);
 matrix_c : OUT matrix_out(0 TO N-1 , 0 TO N-1));
END ENTITY MatrixMultiplier3X3;

ARCHITECTURE behavioral OF MatrixMultiplier3X3 IS

BEGIN
	PROCESS(matrix_a , matrix_b)
		BEGIN 
			FOR i IN 0 TO N-1 LOOP
				FOR j IN 0 TO N-1 LOOP
					matrix_c(i,j) <= STD_LOGIC_VECTOR(UNSIGNED(matrix_a(i,j)) * UNSIGNED(matrix_b(i,j)));
				END LOOP;
			END LOOP;
		END PROCESS;
END behavioral;