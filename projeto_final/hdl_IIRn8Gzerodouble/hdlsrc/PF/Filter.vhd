-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/PF/Filter.vhd
-- Created: 2020-08-11 18:33:35
-- 
-- Generated by MATLAB 8.5 and HDL Coder 3.6
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Filter
-- Source Path: PF/DUT/Filter
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Filter IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        Input                             :   IN    real;  -- double
        Output                            :   OUT   real  -- double
        );
END Filter;


ARCHITECTURE rtl OF Filter IS

  -- Signals
  SIGNAL b_1_out1                         : real := 0.0;  -- double
  SIGNAL b_2_out1                         : real := 0.0;  -- double
  SIGNAL b_3_out1                         : real := 0.0;  -- double
  SIGNAL b_4_out1                         : real := 0.0;  -- double
  SIGNAL b_5_out1                         : real := 0.0;  -- double
  SIGNAL b_6_out1                         : real := 0.0;  -- double
  SIGNAL b_7_out1                         : real := 0.0;  -- double
  SIGNAL b_8_out1                         : real := 0.0;  -- double
  SIGNAL b_9_out1                         : real := 0.0;  -- double
  SIGNAL HeadSum1_out1                    : real := 0.0;  -- double
  SIGNAL a_2_out1                         : real := 0.0;  -- double
  SIGNAL a_3_out1                         : real := 0.0;  -- double
  SIGNAL a_4_out1                         : real := 0.0;  -- double
  SIGNAL a_5_out1                         : real := 0.0;  -- double
  SIGNAL a_6_out1                         : real := 0.0;  -- double
  SIGNAL a_7_out1                         : real := 0.0;  -- double
  SIGNAL a_8_out1                         : real := 0.0;  -- double
  SIGNAL a_9_out1                         : real := 0.0;  -- double
  SIGNAL BodyRSum9_out1                   : real := 0.0;  -- double
  SIGNAL BodyDelay9_out1                  : real := 0.0;  -- double
  SIGNAL BodyLSum8_out1                   : real := 0.0;  -- double
  SIGNAL BodyRSum8_out1                   : real := 0.0;  -- double
  SIGNAL BodyDelay8_out1                  : real := 0.0;  -- double
  SIGNAL BodyLSum7_out1                   : real := 0.0;  -- double
  SIGNAL BodyRSum7_out1                   : real := 0.0;  -- double
  SIGNAL BodyDelay7_out1                  : real := 0.0;  -- double
  SIGNAL BodyLSum6_out1                   : real := 0.0;  -- double
  SIGNAL BodyRSum6_out1                   : real := 0.0;  -- double
  SIGNAL BodyDelay6_out1                  : real := 0.0;  -- double
  SIGNAL BodyLSum5_out1                   : real := 0.0;  -- double
  SIGNAL BodyRSum5_out1                   : real := 0.0;  -- double
  SIGNAL BodyDelay5_out1                  : real := 0.0;  -- double
  SIGNAL BodyLSum4_out1                   : real := 0.0;  -- double
  SIGNAL BodyRSum4_out1                   : real := 0.0;  -- double
  SIGNAL BodyDelay4_out1                  : real := 0.0;  -- double
  SIGNAL BodyLSum3_out1                   : real := 0.0;  -- double
  SIGNAL BodyRSum3_out1                   : real := 0.0;  -- double
  SIGNAL BodyDelay3_out1                  : real := 0.0;  -- double
  SIGNAL BodyLSum2_out1                   : real := 0.0;  -- double
  SIGNAL BodyRSum2_out1                   : real := 0.0;  -- double
  SIGNAL BodyDelay2_out1                  : real := 0.0;  -- double

BEGIN
  b_1_out1 <= 0.064737550807868 * Input;

  b_2_out1 <= 0.0476938020848489 * Input;

  b_3_out1 <= (-0.118514858534853) * Input;

  b_4_out1 <= (-0.0163723590164326) * Input;

  b_5_out1 <= 0.173997429824646 * Input;

  b_6_out1 <= (-0.0163723590164326) * Input;

  b_7_out1 <= (-0.118514858534853) * Input;

  b_8_out1 <= 0.0476938020848489 * Input;

  b_9_out1 <= 0.064737550807868 * Input;

  a_2_out1 <= 2.09183633896532 * HeadSum1_out1;

  a_3_out1 <= 2.76979262441331 * HeadSum1_out1;

  a_4_out1 <= 2.67833628318659 * HeadSum1_out1;

  a_5_out1 <= 2.24039765311534 * HeadSum1_out1;

  a_6_out1 <= 1.31221211034448 * HeadSum1_out1;

  a_7_out1 <= 0.589222836584441 * HeadSum1_out1;

  a_8_out1 <= 0.181903881186868 * HeadSum1_out1;

  a_9_out1 <= 0.0448683229545886 * HeadSum1_out1;

  BodyRSum9_out1 <= b_9_out1 - a_9_out1;

  BodyDelay9_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      BodyDelay9_out1 <= 0.0;
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        BodyDelay9_out1 <= BodyRSum9_out1;
      END IF;
    END IF;
  END PROCESS BodyDelay9_process;


  BodyLSum8_out1 <= b_8_out1 + BodyDelay9_out1;

  BodyRSum8_out1 <= BodyLSum8_out1 - a_8_out1;

  BodyDelay8_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      BodyDelay8_out1 <= 0.0;
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        BodyDelay8_out1 <= BodyRSum8_out1;
      END IF;
    END IF;
  END PROCESS BodyDelay8_process;


  BodyLSum7_out1 <= b_7_out1 + BodyDelay8_out1;

  BodyRSum7_out1 <= BodyLSum7_out1 - a_7_out1;

  BodyDelay7_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      BodyDelay7_out1 <= 0.0;
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        BodyDelay7_out1 <= BodyRSum7_out1;
      END IF;
    END IF;
  END PROCESS BodyDelay7_process;


  BodyLSum6_out1 <= b_6_out1 + BodyDelay7_out1;

  BodyRSum6_out1 <= BodyLSum6_out1 - a_6_out1;

  BodyDelay6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      BodyDelay6_out1 <= 0.0;
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        BodyDelay6_out1 <= BodyRSum6_out1;
      END IF;
    END IF;
  END PROCESS BodyDelay6_process;


  BodyLSum5_out1 <= b_5_out1 + BodyDelay6_out1;

  BodyRSum5_out1 <= BodyLSum5_out1 - a_5_out1;

  BodyDelay5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      BodyDelay5_out1 <= 0.0;
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        BodyDelay5_out1 <= BodyRSum5_out1;
      END IF;
    END IF;
  END PROCESS BodyDelay5_process;


  BodyLSum4_out1 <= b_4_out1 + BodyDelay5_out1;

  BodyRSum4_out1 <= BodyLSum4_out1 - a_4_out1;

  BodyDelay4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      BodyDelay4_out1 <= 0.0;
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        BodyDelay4_out1 <= BodyRSum4_out1;
      END IF;
    END IF;
  END PROCESS BodyDelay4_process;


  BodyLSum3_out1 <= b_3_out1 + BodyDelay4_out1;

  BodyRSum3_out1 <= BodyLSum3_out1 - a_3_out1;

  BodyDelay3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      BodyDelay3_out1 <= 0.0;
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        BodyDelay3_out1 <= BodyRSum3_out1;
      END IF;
    END IF;
  END PROCESS BodyDelay3_process;


  BodyLSum2_out1 <= b_2_out1 + BodyDelay3_out1;

  BodyRSum2_out1 <= BodyLSum2_out1 - a_2_out1;

  BodyDelay2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      BodyDelay2_out1 <= 0.0;
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        BodyDelay2_out1 <= BodyRSum2_out1;
      END IF;
    END IF;
  END PROCESS BodyDelay2_process;


  HeadSum1_out1 <= b_1_out1 + BodyDelay2_out1;

  Output <= HeadSum1_out1;

END rtl;

