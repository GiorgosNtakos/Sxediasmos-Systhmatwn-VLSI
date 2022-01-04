LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.NUMERIC_STD.all;

ENTITY RAM IS
GENERIC(A:INTEGER:=5;
	n:INTEGER:=8);
PORT(
	  WR:   IN STD_LOGIC; --WR=1 Write Enable alliws Read Enable
	  ADDR: IN STD_LOGIC_VECTOR(A-1 DOWNTO 0); --RAM dieuthinseis
	  DIN:  IN STD_LOGIC_VECTOR(n-1 DOWNTO 0); --Write Dedomena
	  DOUT: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)); --Read Dedomena
END ENTITY RAM;

ARCHITECTURE RAMbehavior OF RAM IS
	SUBTYPE word  IS STD_LOGIC_VECTOR(n-1 DOWNTO 0); --Kathorise to megethos ths lekshs
	TYPE 	MEMORY is ARRAY(0 to 2**A-1) OF  word; --Megethos ths Mnhmhs
	SIGNAL 	RAM_32_BYTES: MEMORY; --RAM_32_BYTES ws shma toy typoy MEMORY	
	
BEGIN
	PROCESS(WR,DIN,ADDR)
		VARIABLE RAM_ADDR_IN: NATURAL RANGE 0 to 2**A-1; --Dieuthinseis se akereous
		VARIABLE INITIALIZE: BOOLEAN:=TRUE; --metablhth gia arxikopoihsh ths mnhmhs
	BEGIN
	RAM_ADDR_IN:=TO_INTEGER(UNSIGNED(ADDR)); --Metatropi dieuthinsewn se akeraious
		IF(INITIALIZE=TRUE) THEN 
			RAM_32_BYTES<=(0=>"00000001",
				       1=>"00000010", --Arxikopouhsh ths mnhmhs bazontas times
				       2=>"00000011", --Stis protes 4 thesis ths mhnmhs >0      									  													
				       3=>"00000100", --Kai se oles tis alles 0
				       OTHERS=>"00000000");
			DOUT<="XXXXXXXX"; --Mh kathorismenes times sthn eksodo ths RAM
			INITIALIZE:=FALSE; --H arxikopoihsh etsi ekteleite 
							   --mono mia fora sthn arxh
		ELSIF (WR='1') THEN --Diadikasia Eggrafhs Dedomenwn
			RAM_32_BYTES(RAM_ADDR_IN)<=DIN; --Synexeia anagnosis
		END IF;
			
		DOUT<=RAM_32_BYTES(RAM_ADDR_IN); --Sunexeia Anagnosis
	END PROCESS;
		
END ARCHITECTURE RAMbehavior;
					