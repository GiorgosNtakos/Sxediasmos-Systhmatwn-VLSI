LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.mult_3x3_pack.ALL;

ENTITY multiplier_tb IS
END multiplier_tb;

ARCHITECTURE tb OF multiplier_tb IS
  CONSTANT N : NATURAL := 3;

  SIGNAL A : matrix_in (0 TO N-1, 0 TO N-1);
  SIGNAL B : matrix_in (0 TO N-1, 0 TO N-1);
  SIGNAL C : matrix_out(0 TO N-1, 0 TO N-1);

  COMPONENT MatrixMultiplier3X3 IS
    GENERIC (N : NATURAL := 3);
    PORT(
      matrix_a : IN  matrix_in (0 TO N-1, 0 TO N-1);
      matrix_b : IN  matrix_in (0 TO N-1, 0 TO N-1);
      matrix_c : OUT matrix_out(0 TO N-1, 0 TO N-1)
    );
  END COMPONENT;

  -- helper function για expected (unsigned)
  FUNCTION exp_mul(x : STD_LOGIC_VECTOR(4 DOWNTO 0);
                   y : STD_LOGIC_VECTOR(4 DOWNTO 0)) RETURN STD_LOGIC_VECTOR IS
    VARIABLE r : unsigned(9 DOWNTO 0);
  BEGIN
    r := unsigned(x) * unsigned(y);
    RETURN std_logic_vector(r);
  END FUNCTION;

BEGIN
  DUT: MatrixMultiplier3X3
    GENERIC MAP(N => N)
    PORT MAP(matrix_a => A, matrix_b => B, matrix_c => C);

  stim: PROCESS
  BEGIN
    -- Test 1: μηδενικά
    FOR i IN 0 TO N-1 LOOP
      FOR j IN 0 TO N-1 LOOP
        A(i,j) <= std_logic_vector(to_unsigned(0,5));
        B(i,j) <= std_logic_vector(to_unsigned(0,5));
      END LOOP;
    END LOOP;
    WAIT FOR 10 ns;

    FOR i IN 0 TO N-1 LOOP
      FOR j IN 0 TO N-1 LOOP
        ASSERT C(i,j) = exp_mul(A(i,j), B(i,j))
          REPORT "Mismatch at test1 (" & integer'image(i) & "," & integer'image(j) & ")"
          SEVERITY ERROR;
      END LOOP;
    END LOOP;

    -- Test 2: 31*31 = 961
    FOR i IN 0 TO N-1 LOOP
      FOR j IN 0 TO N-1 LOOP
        A(i,j) <= std_logic_vector(to_unsigned(31,5));
        B(i,j) <= std_logic_vector(to_unsigned(31,5));
      END LOOP;
    END LOOP;
    WAIT FOR 10 ns;

    FOR i IN 0 TO N-1 LOOP
      FOR j IN 0 TO N-1 LOOP
        ASSERT C(i,j) = exp_mul(A(i,j), B(i,j))
          REPORT "Mismatch at test2 (" & integer'image(i) & "," & integer'image(j) & ")"
          SEVERITY ERROR;
      END LOOP;
    END LOOP;

    -- Test 3: μικτό pattern
    A(0,0) <= std_logic_vector(to_unsigned(1,5));  B(0,0) <= std_logic_vector(to_unsigned(31,5));
    A(0,1) <= std_logic_vector(to_unsigned(2,5));  B(0,1) <= std_logic_vector(to_unsigned(16,5));
    A(0,2) <= std_logic_vector(to_unsigned(3,5));  B(0,2) <= std_logic_vector(to_unsigned(15,5));

    A(1,0) <= std_logic_vector(to_unsigned(4,5));  B(1,0) <= std_logic_vector(to_unsigned(14,5));
    A(1,1) <= std_logic_vector(to_unsigned(5,5));  B(1,1) <= std_logic_vector(to_unsigned(13,5));
    A(1,2) <= std_logic_vector(to_unsigned(6,5));  B(1,2) <= std_logic_vector(to_unsigned(12,5));

    A(2,0) <= std_logic_vector(to_unsigned(7,5));  B(2,0) <= std_logic_vector(to_unsigned(11,5));
    A(2,1) <= std_logic_vector(to_unsigned(8,5));  B(2,1) <= std_logic_vector(to_unsigned(10,5));
    A(2,2) <= std_logic_vector(to_unsigned(9,5));  B(2,2) <= std_logic_vector(to_unsigned(9,5));
    WAIT FOR 10 ns;

    FOR i IN 0 TO N-1 LOOP
      FOR j IN 0 TO N-1 LOOP
        ASSERT C(i,j) = exp_mul(A(i,j), B(i,j))
          REPORT "Mismatch at test3 (" & integer'image(i) & "," & integer'image(j) & ")"
          SEVERITY ERROR;
      END LOOP;
    END LOOP;

    REPORT "All tests PASSED." SEVERITY NOTE;
    WAIT;
  END PROCESS;

END tb;
