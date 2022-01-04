LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY testbenchBigLunit IS
END testbenchBigLunit;

ARCHITECTURE testbench OF testbenchBigLunit IS 
    COMPONENT bigLunit
    GENERIC(
	N: NATURAL := 120);
	PORT(
	 inp1    : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	 inp2    : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	 sel     : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	 output	 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
	END COMPONENT;	

	
	CONSTANT N : NATURAL := 120;
	signal sele  : STD_LOGIC_VECTOR(1 DOWNTO 0);
	signal INA  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	signal INB  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	signal OutY : STD_LOGIC_VECTOR(N-1 DOWNTO 0);	
	
BEGIN
	
	
	Big_L_Uit: bigLunit GENERIC MAP(N) PORT MAP(INA,INB,sele,OutY);

	
	stim_proc: process
	BEGIN
	sele  <= "00";
	INA  <= (OTHERS => '0');
	INB  <= (OTHERS => '0');
		
		WAIT FOR 50 ns;
	sele  <= "00";
	INA  <= (OTHERS => '0');
	INB  <= (OTHERS => '1');
	
		WAIT FOR 50 ns;
	sele  <= "00";
	INA  <= (OTHERS => '1');
	INB  <= (OTHERS => '0');
	
		WAIT FOR 50 NS;
	sele  <= "00";
	INA  <= (OTHERS => '1');
	INB  <= (OTHERS => '1');
		
		WAIT FOR 50 NS;
	sele  <= "01";
	INA  <= (OTHERS => '0');
	INB  <= (OTHERS => '0');
		
		WAIT FOR 50 ns;
	sele  <= "01";
	INA  <= (OTHERS => '0');
	INB  <= (OTHERS => '1');
	
		WAIT FOR 50 ns;
 	sele  <= "01";
	INA  <= (OTHERS => '1');
	INB  <= (OTHERS => '0');
	
		WAIT FOR 50 NS;
	sele  <= "01";
	INA  <= (OTHERS => '1');
	INB  <= (OTHERS => '1');
		
		WAIT FOR 50 NS;
	sele  <= "10";		
	INA  <= (OTHERS => '0');
	INB  <= (OTHERS => '0');
		
		WAIT FOR 50 ns;
	sele  <= "10";
	INA  <= (OTHERS => '0');
	INB  <= (OTHERS => '1');
	
		WAIT FOR 50 ns;
	sele  <= "10";
	INA  <= (OTHERS => '1');
	INB  <= (OTHERS => '0');
	
		WAIT FOR 50 NS;
	sele  <= "10";
	INA  <= (OTHERS => '1');
	INB  <= (OTHERS => '1');
		
		WAIT FOR 50 NS;
	sele  <= "11";
	INA  <= (OTHERS => '0');
	INB  <= (OTHERS => '0');
		
		WAIT FOR 50 ns;
	sele  <= "11";
	INA  <= (OTHERS => '0');
	INB  <= (OTHERS => '1');
	
		WAIT FOR 50 ns;
	sele  <= "11";
	INA  <= (OTHERS => '1');
	INB  <= (OTHERS => '0');
	
		WAIT FOR 50 NS;
	sele  <= "11";
	INA  <= (OTHERS => '1');
	INB  <= (OTHERS => '1');
		
		WAIT; 
	
	END PROCESS;
	
END;
		