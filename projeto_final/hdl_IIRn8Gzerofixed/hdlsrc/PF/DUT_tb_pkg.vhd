-- -------------------------------------------------------------
--
-- Module: DUT_tb_pkg
-- Path: /home/aluno/Documentos/PSD/PF/hdl_IIRn8Gzerofixed/hdlsrc/PF
-- Created: 2020-08-11 12:57:24
-- Generated by MATLAB 8.5 and HDL Coder 3.6
-- Description: test bench package
--
--
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;
USE STD.textio.ALL;
USE IEEE.std_logic_textio.ALL;


PACKAGE DUT_tb_pkg IS

  -- Type Definitions

  -- Functions
  FUNCTION to_integer( x : IN std_logic) RETURN integer;
  FUNCTION to_hex( x : IN std_logic) RETURN string;
  FUNCTION to_hex( x : IN std_logic_vector) RETURN string;
  FUNCTION to_hex( x : IN signed ) RETURN string;
  FUNCTION to_hex( x : IN unsigned ) RETURN string;
  FUNCTION to_hex( x : IN real ) RETURN string;
  FUNCTION SLICE( x : IN bit_vector; slice : In Integer) RETURN std_logic_vector;
  FUNCTION SLICE( x : IN bit_vector; slice : In Integer) RETURN signed;
  FUNCTION SLICE( x : IN bit_vector; slice : In Integer) RETURN unsigned;

  -- Procedures
  PROCEDURE Data_Type_Conversion_out1_procedure 
    (SIGNAL clk      : IN    std_logic;
     SIGNAL reset    : IN    std_logic;
     SIGNAL rdenb    : IN    std_logic;
     SIGNAL addr     : INOUT unsigned(13 DOWNTO 0);
     SIGNAL done     : OUT   std_logic);

  PROCEDURE Y_procedure 
    (SIGNAL clk      : IN    std_logic;
     SIGNAL reset    : IN    std_logic;
     SIGNAL rdenb    : IN    std_logic;
     SIGNAL addr     : INOUT unsigned(13 DOWNTO 0);
     SIGNAL done     : OUT   std_logic);

END DUT_tb_pkg;

PACKAGE BODY DUT_tb_pkg IS
  FUNCTION to_integer( x : IN std_logic) RETURN integer IS
    VARIABLE int: integer;
  BEGIN
    IF x = '0' THEN
      int := 0;
    ELSE
      int := 1;
    END IF;
    RETURN int;
  END;

  FUNCTION to_hex( x : IN std_logic_vector) RETURN string IS
    VARIABLE result  : STRING(1 TO 256); -- 1024 bits max
    VARIABLE i       : INTEGER;
    VARIABLE imod    : INTEGER;
    VARIABLE j       : INTEGER;
    VARIABLE jinc    : INTEGER;
    VARIABLE newx    : std_logic_vector(1023 DOWNTO 0);
  BEGIN
    newx := (OTHERS => '0');
    IF x'LEFT > x'RIGHT THEN
      j := x'LENGTH-1;
      jinc := -1;
    ELSE
      j := 0;
      jinc := 1;
    END IF;
    FOR i IN x'RANGE LOOP
      newx(j) := x(i);
      j := j+jinc;
    END LOOP;  -- i
    i := x'LENGTH-1;
    imod := x'LENGTH MOD 4;
    IF    imod = 1 THEN i := i+3;
    ELSIF imod = 2 THEN i := i+2;
    ELSIF imod = 3 THEN i := i+1;
    END IF;
    j := 1;
    WHILE i >= 3 LOOP
      IF    newx(i DOWNTO (i-3)) = "0000" THEN result(j) := '0';
      ELSIF newx(i DOWNTO (i-3)) = "0001" THEN result(j) := '1';
      ELSIF newx(i DOWNTO (i-3)) = "0010" THEN result(j) := '2';
      ELSIF newx(i DOWNTO (i-3)) = "0011" THEN result(j) := '3';
      ELSIF newx(i DOWNTO (i-3)) = "0100" THEN result(j) := '4';
      ELSIF newx(i DOWNTO (i-3)) = "0101" THEN result(j) := '5';
      ELSIF newx(i DOWNTO (i-3)) = "0110" THEN result(j) := '6';
      ELSIF newx(i DOWNTO (i-3)) = "0111" THEN result(j) := '7';
      ELSIF newx(i DOWNTO (i-3)) = "1000" THEN result(j) := '8';
      ELSIF newx(i DOWNTO (i-3)) = "1001" THEN result(j) := '9';
      ELSIF newx(i DOWNTO (i-3)) = "1010" THEN result(j) := 'A';
      ELSIF newx(i DOWNTO (i-3)) = "1011" THEN result(j) := 'B';
      ELSIF newx(i DOWNTO (i-3)) = "1100" THEN result(j) := 'C';
      ELSIF newx(i DOWNTO (i-3)) = "1101" THEN result(j) := 'D';
      ELSIF newx(i DOWNTO (i-3)) = "1110" THEN result(j) := 'E';
      ELSIF newx(i DOWNTO (i-3)) = "1111" THEN result(j) := 'F';
      ELSE result(j) := 'X';
      END IF;
      i := i-4;
      j := j+1;
    END LOOP;
    RETURN result(1 TO j-1);
  END;


  FUNCTION to_hex( x : IN std_logic ) RETURN string IS
  BEGIN
    RETURN std_logic'image(x);
  END;


  FUNCTION to_hex( x : IN signed ) RETURN string IS
  BEGIN
    RETURN to_hex( std_logic_vector(x) );
  END;


  FUNCTION to_hex( x : IN unsigned ) RETURN string IS
  BEGIN
    RETURN to_hex( std_logic_vector(x) );
  END;


  FUNCTION to_hex( x : IN real ) RETURN string IS
  BEGIN
    RETURN real'image(x);
  END;


  FUNCTION SLICE( x : IN bit_vector; slice : IN Integer) RETURN std_logic_vector IS
    variable result : std_logic_vector(slice - 1 DOWNTO 0);
  BEGIN
    result := to_stdlogicvector(bit_vector'(x))(slice - 1 DOWNTO 0);
    RETURN result;
  END;


  FUNCTION SLICE( x : IN bit_vector; slice : IN Integer) RETURN signed IS
    variable result : signed(slice -  1 DOWNTO 0);
  BEGIN
    result := signed(to_stdlogicvector(bit_vector'(x))(slice - 1 DOWNTO 0));
    RETURN result;
  END;


  FUNCTION SLICE( x : IN bit_vector; slice : IN Integer) RETURN unsigned IS
    variable result : unsigned(slice -  1 DOWNTO 0);
  BEGIN
    result := unsigned(to_stdlogicvector(bit_vector'(x))(slice - 1 DOWNTO 0));
    RETURN result;
  END;


  PROCEDURE Data_Type_Conversion_out1_procedure 
    (SIGNAL clk      : IN    std_logic;
     SIGNAL reset    : IN    std_logic;
     SIGNAL rdenb    : IN    std_logic;
     SIGNAL addr     : INOUT unsigned(13 DOWNTO 0);
     SIGNAL done     : OUT   std_logic) IS
  BEGIN
-- Counter to generate Addr.
    IF reset = '1' THEN
      addr     <= TO_UNSIGNED(0,14);
    ELSIF clk'event and clk = '1' THEN
      IF rdenb = '1' THEN
        IF (addr = TO_UNSIGNED(16000, 14 )) THEN
          addr     <= addr; 
        ELSE
          addr     <= addr + TO_UNSIGNED(1,14) after 1 ns; 
        END IF;
      ELSE 
        addr <= addr;
      END IF;
    END IF;

-- Done Signal generation.
    IF reset = '1' THEN
      done <= '0'; 
    ELSIF (addr = TO_UNSIGNED(16000, 14 )) THEN
      done <= '1'; 
    ELSE
      done <= '0'; 
    END IF;
  END Data_Type_Conversion_out1_procedure;

  PROCEDURE Y_procedure 
    (SIGNAL clk      : IN    std_logic;
     SIGNAL reset    : IN    std_logic;
     SIGNAL rdenb    : IN    std_logic;
     SIGNAL addr     : INOUT unsigned(13 DOWNTO 0);
     SIGNAL done     : OUT   std_logic) IS
  BEGIN
-- Counter to generate Addr.
    IF reset = '1' THEN
      addr     <= TO_UNSIGNED(0,14);
    ELSIF clk'event and clk = '1' THEN
      IF rdenb = '1' THEN
        IF (addr = TO_UNSIGNED(16000, 14 )) THEN
          addr     <= addr; 
        ELSE
          addr     <= addr + TO_UNSIGNED(1,14) after 1 ns; 
        END IF;
      ELSE 
        addr <= addr;
      END IF;
    END IF;

-- Done Signal generation.
    IF reset = '1' THEN
      done <= '0'; 
    ELSIF (addr = TO_UNSIGNED(16000, 14 )) THEN
      done <= '1'; 
    ELSE
      done <= '0'; 
    END IF;
  END Y_procedure;

END DUT_tb_pkg;

