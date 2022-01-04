LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY RAMB36 IS
GENERIC(A:INTEGER:=5;
	n:INTEGER:=8);
PORT( 
	  WRADDR: IN STD_LOGIC_VECTOR(A-1 DOWNTO 0);
	  RDADDR: IN STD_LOGIC_VECTOR(A-1 DOWNTO 0); 
	  DI:  IN STD_LOGIC_VECTOR(n-1 DOWNTO 0); 
	  DO: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
	  RDCLK: IN STD_LOGIC;
	  WRCLK: IN STD_LOGIC;
	  WREN: IN STD_LOGIC;
	  RDEN: IN STD_LOGIC);
END ENTITY RAMB36;	

ARCHITECTURE RAMbehavior OF RAMB36 IS
	SUBTYPE word  IS STD_LOGIC_VECTOR(n-1 DOWNTO 0); --Kathorise to megethos ths lekshs
	TYPE 	MEMORY is ARRAY(0 to 2**A-1) OF  word; --Megethos ths Mnhmhs
	SIGNAL 	RAM_32_BYTES: MEMORY; --RAM_32_BYTES ws shma toy typoy MEMORY	
	
BEGIN
	PROCESS(DI,RDADDR,RDCLK,WRCLK,WREN,RDEN,WRADDR)
		VARIABLE RAM_ADDR_WRIN: NATURAL RANGE 0 to 2**A-1; --Dieuthinseis se akereous
		VARIABLE RAM_ADDR_RDIN: NATURAL RANGE 0 to 2**A-1;
		VARIABLE INITIALIZE: BOOLEAN:=TRUE; --metablhth gia arxikopoihsh ths mnhmhs
	BEGIN
	RAM_ADDR_WRIN:=TO_INTEGER(UNSIGNED(WRADDR)); --Metatropi dieuthinsewn se akeraious
	RAM_ADDR_RDIN:=TO_INTEGER(UNSIGNED(RDADDR)); --Metatropi dieuthinsewn se akeraious
		IF(INITIALIZE=TRUE) THEN 
			RAM_32_BYTES<=(0=>"00000001",
				       1=>"00000010", --Arxikopouhsh ths mnhmhs bazontas times
				       2=>"00000011", --Stis protes 4 thesis ths mhnmhs >0      									  													
				       3=>"00000100", --Kai se oles tis alles 0
				       OTHERS=>"00000000");
			DO<="XXXXXXXX"; --Mh kathorismenes times sthn eksodo ths RAM
			INITIALIZE:=FALSE; --H arxikopoihsh etsi ekteleite 
							   --mono mia fora sthn arxh
		ELSIF (WREN='1'AND WRCLK'EVENT AND WRCLK='1') THEN --Diadikasia Eggrafhs Dedomenwn
			RAM_32_BYTES(RAM_ADDR_WRIN)<=DI;
		ELSIF(RDEN = '1' AND RDCLK'EVENT AND RDCLK='1') THEN
			DO<=RAM_32_BYTES(RAM_ADDR_RDIN); --Sunexeia Anagnosis
		END IF;		
	END PROCESS;
		
END ARCHITECTURE RAMbehavior;