LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY bigLunit IS
  GENERIC (N : NATURAL := 120);
  PORT(
    inp1   : IN  std_logic_vector(N-1 downto 0);
    inp2   : IN  std_logic_vector(N-1 downto 0);
    sel    : IN  std_logic_vector(1 downto 0);
    output : OUT std_logic_vector(N-1 downto 0)
  );
END bigLunit;

ARCHITECTURE structural OF bigLunit IS

  -- Components
  COMPONENT xor8 IS
    GENERIC (N : NATURAL := 8);
    PORT(
      A : IN  std_logic_vector(N-1 downto 0);
      B : IN  std_logic_vector(N-1 downto 0);
      Y : OUT std_logic_vector(N-1 downto 0)
    );
  END COMPONENT;

  COMPONENT or16 IS
    GENERIC (N : NATURAL := 16);
    PORT(
      A : IN  std_logic_vector(N-1 downto 0);
      B : IN  std_logic_vector(N-1 downto 0);
      Y : OUT std_logic_vector(N-1 downto 0)
    );
  END COMPONENT;

  COMPONENT nand32 IS
    GENERIC (N : NATURAL := 32);
    PORT(
      A : IN  std_logic_vector(N-1 downto 0);
      B : IN  std_logic_vector(N-1 downto 0);
      Y : OUT std_logic_vector(N-1 downto 0)
    );
  END COMPONENT;

  COMPONENT nor64 IS
    GENERIC (N : NATURAL := 64);
    PORT(
      A : IN  std_logic_vector(N-1 downto 0);
      B : IN  std_logic_vector(N-1 downto 0);
      Y : OUT std_logic_vector(N-1 downto 0)
    );
  END COMPONENT;

  COMPONENT mux IS
    GENERIC (N : NATURAL := 120);
    PORT(
      a   : IN  std_logic_vector(N-1 downto 0);
      b   : IN  std_logic_vector(N-1 downto 0);
      c   : IN  std_logic_vector(N-1 downto 0);
      d   : IN  std_logic_vector(N-1 downto 0);
      sel : IN  std_logic_vector(1 downto 0);
      x   : OUT std_logic_vector(N-1 downto 0)
    );
  END COMPONENT;

  -- Σταθερά ranges
  CONSTANT W_XOR  : NATURAL := 8;
  CONSTANT W_OR   : NATURAL := 16;
  CONSTANT W_NAND : NATURAL := 32;
  CONSTANT W_NOR  : NATURAL := 64;

  -- Gated inputs προς τις πύλες (ώστε μόνο μία να “τρέχει” κάθε φορά)
  SIGNAL a_xor,  b_xor  : std_logic_vector(W_XOR-1 downto 0);
  SIGNAL a_or,   b_or   : std_logic_vector(W_OR-1 downto 0);
  SIGNAL a_nand, b_nand : std_logic_vector(W_NAND-1 downto 0);
  SIGNAL a_nor,  b_nor  : std_logic_vector(W_NOR-1 downto 0);

  -- Outputs από πύλες
  SIGNAL outXor  : std_logic_vector(W_XOR-1 downto 0);
  SIGNAL outOr   : std_logic_vector(W_OR-1 downto 0);
  SIGNAL outNand : std_logic_vector(W_NAND-1 downto 0);
  SIGNAL outNor  : std_logic_vector(W_NOR-1 downto 0);

  -- 4 εναλλακτικές 120-bit “εικόνες” αποτελέσματος
  SIGNAL in0_mux, in1_mux, in2_mux, in3_mux : std_logic_vector(N-1 downto 0);

BEGIN

  -- Input gating: μόνο η επιλεγμένη πύλη παίρνει πραγματικά δεδομένα
  a_xor  <= inp1(7 downto 0)    WHEN sel = "00" ELSE (OTHERS => '0');
  b_xor  <= inp2(7 downto 0)    WHEN sel = "00" ELSE (OTHERS => '0');

  a_or   <= inp1(23 downto 8)   WHEN sel = "01" ELSE (OTHERS => '0');
  b_or   <= inp2(23 downto 8)   WHEN sel = "01" ELSE (OTHERS => '0');

  a_nand <= inp1(55 downto 24)  WHEN sel = "10" ELSE (OTHERS => '0');
  b_nand <= inp2(55 downto 24)  WHEN sel = "10" ELSE (OTHERS => '0');

  a_nor  <= inp1(119 downto 56) WHEN sel = "11" ELSE (OTHERS => '0');
  b_nor  <= inp2(119 downto 56) WHEN sel = "11" ELSE (OTHERS => '0');

  -- Instantiate gates with fixed widths
  XOR_GATE  : xor8   GENERIC MAP(8)  PORT MAP(a_xor,  b_xor,  outXor);
  OR_GATE   : or16   GENERIC MAP(16) PORT MAP(a_or,   b_or,   outOr);
  NAND_GATE : nand32 GENERIC MAP(32) PORT MAP(a_nand, b_nand, outNand);
  NOR_GATE  : nor64  GENERIC MAP(64) PORT MAP(a_nor,  b_nor,  outNor);

  -- Pack αποτελέσματα σε 120-bit vector, με 0 στα υπόλοιπα bits
  in0_mux <= (N-1 downto 8  => '0') & outXor;                                -- XOR στα [7:0]
  in1_mux <= (N-1 downto 24 => '0') & outOr   & (7 downto 0  => '0');        -- OR  στα [23:8]
  in2_mux <= (N-1 downto 56 => '0') & outNand & (23 downto 0 => '0');        -- NAND στα [55:24]
  in3_mux <= outNor & (55 downto 0 => '0');                                  -- NOR στα [119:56]

  -- Επιλογή μόνο ενός αποτελέσματος προς έξοδο
  MUX_GATE : mux GENERIC MAP(N) PORT MAP(in0_mux, in1_mux, in2_mux, in3_mux, sel, output);

END structural;
