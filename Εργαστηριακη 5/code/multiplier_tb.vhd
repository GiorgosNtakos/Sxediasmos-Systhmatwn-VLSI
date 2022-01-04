LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

USE work.mult_3x3_pack.all;

ENTITY matrix_tb IS
END matrix_tb;

ARCHITECTURE testbench OF matrix_tb IS 
    COMPONENT Bits5MatrixMultiplier3X3
    GENERIC(
	N: NATURAL := 3);
	PORT(
		 matrix_a : IN matrix_in(0 TO N-1,0 TO N-1);
 		 matrix_b : IN matrix_in(0 TO N-1,0 TO N-1);
		 matrix_c : OUT matrix_out(0 TO N-1,0 TO N-1));
	END COMPONENT;	
	
	CONSTANT N   : NATURAL :=3;
	SIGNAL IN_A  :  matrix_in(0 TO N-1 , 0 TO N-1);
	SIGNAL IN_B  :  matrix_in(0 TO N-1 , 0 TO N-1);
	SIGNAL OUT_C :  matrix_out(0 TO N-1 , 0 TO N-1);
	
	BEGIN
	
	
		Multiplier: Bits5MatrixMultiplier3X3 GENERIC MAP(N) PORT MAP(IN_A,IN_B,OUT_C);
		
		stim_proc: PROCESS
		BEGIN
		
		IN_A <= ((STD_LOGIC_VECTOR(to_signed(1,5)) , STD_LOGIC_VECTOR(to_signed(0,5)), STD_LOGIC_VECTOR(to_signed(0,5))),
			 (STD_LOGIC_VECTOR(to_signed(0,5)) , STD_LOGIC_VECTOR(to_signed(1,5)), STD_LOGIC_VECTOR(to_signed(0,5))),
			 (STD_LOGIC_VECTOR(to_signed(0,5)) , STD_LOGIC_VECTOR(to_signed(0,5)), STD_LOGIC_VECTOR(to_signed(1,5))));
		
		
		IN_B <= ((STD_LOGIC_VECTOR(to_signed(4,5)) , STD_LOGIC_VECTOR(to_signed(0,5)), STD_LOGIC_VECTOR(to_signed(0,5))),
			 (STD_LOGIC_VECTOR(to_signed(0,5)) , STD_LOGIC_VECTOR(to_signed(5,5)), STD_LOGIC_VECTOR(to_signed(0,5))),
			 (STD_LOGIC_VECTOR(to_signed(0,5)) , STD_LOGIC_VECTOR(to_signed(0,5)), STD_LOGIC_VECTOR(to_signed(6,5))));
				 
			WAIT FOR 20 ns;	

		IN_A <= ((STD_LOGIC_VECTOR(to_signed(-1,5)) , STD_LOGIC_VECTOR(to_signed(0,5)), STD_LOGIC_VECTOR(to_signed(0,5))),
			 (STD_LOGIC_VECTOR(to_signed(0,5)) , STD_LOGIC_VECTOR(to_signed(-1,5)), STD_LOGIC_VECTOR(to_signed(0,5))),
			 (STD_LOGIC_VECTOR(to_signed(0,5)) , STD_LOGIC_VECTOR(to_signed(0,5)), STD_LOGIC_VECTOR(to_signed(-1,5))));
		
		
		IN_B <= ((STD_LOGIC_VECTOR(to_signed(4,5)) , STD_LOGIC_VECTOR(to_signed(0,5)), STD_LOGIC_VECTOR(to_signed(0,5))),
			 (STD_LOGIC_VECTOR(to_signed(0,5)) , STD_LOGIC_VECTOR(to_signed(5,5)), STD_LOGIC_VECTOR(to_signed(0,5))),
			 (STD_LOGIC_VECTOR(to_signed(0,5)) , STD_LOGIC_VECTOR(to_signed(0,5)), STD_LOGIC_VECTOR(to_signed(6,5))));
				 
			WAIT FOR 20 ns;		

		IN_A <= ((STD_LOGIC_VECTOR(to_signed(-1,5)) , STD_LOGIC_VECTOR(to_signed(0,5)), STD_LOGIC_VECTOR(to_signed(0,5))),
			 (STD_LOGIC_VECTOR(to_signed(0,5)) , STD_LOGIC_VECTOR(to_signed(-1,5)), STD_LOGIC_VECTOR(to_signed(0,5))),
			 (STD_LOGIC_VECTOR(to_signed(0,5)) , STD_LOGIC_VECTOR(to_signed(0,5)), STD_LOGIC_VECTOR(to_signed(-1,5))));
		
		
		IN_B <= ((STD_LOGIC_VECTOR(to_signed(-4,5)) , STD_LOGIC_VECTOR(to_signed(0,5)), STD_LOGIC_VECTOR(to_signed(0,5))),
			 (STD_LOGIC_VECTOR(to_signed(0,5)) , STD_LOGIC_VECTOR(to_signed(-5,5)), STD_LOGIC_VECTOR(to_signed(0,5))),
			 (STD_LOGIC_VECTOR(to_signed(0,5)) , STD_LOGIC_VECTOR(to_signed(0,5)), STD_LOGIC_VECTOR(to_signed(-6,5))));

			WAIT FOR 20 ns; 

		IN_A <= ((STD_LOGIC_VECTOR(to_signed(-16,5)) , STD_LOGIC_VECTOR(to_signed(0,5)), STD_LOGIC_VECTOR(to_signed(0,5))),
			 (STD_LOGIC_VECTOR(to_signed(0,5)) , STD_LOGIC_VECTOR(to_signed(15,5)), STD_LOGIC_VECTOR(to_signed(0,5))),
			 (STD_LOGIC_VECTOR(to_signed(0,5)) , STD_LOGIC_VECTOR(to_signed(0,5)), STD_LOGIC_VECTOR(to_signed(15,5))));
		
		
		IN_B <= ((STD_LOGIC_VECTOR(to_signed(-16,5)) , STD_LOGIC_VECTOR(to_signed(0,5)), STD_LOGIC_VECTOR(to_signed(0,5))),
			 (STD_LOGIC_VECTOR(to_signed(0,5)) , STD_LOGIC_VECTOR(to_signed(-16,5)), STD_LOGIC_VECTOR(to_signed(0,5))),
			 (STD_LOGIC_VECTOR(to_signed(0,5)) , STD_LOGIC_VECTOR(to_signed(0,5)), STD_LOGIC_VECTOR(to_signed(15,5))));


			WAIT;
			
		END PROCESS;
		
	
END;
		
