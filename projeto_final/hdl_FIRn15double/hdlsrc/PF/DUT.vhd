-- -------------------------------------------------------------
-- 
-- File Name: /home/aluno/Documentos/PSD/PF/hdl_FIRn15double/hdlsrc/PF/DUT.vhd
-- Created: 2020-08-11 07:28:47
-- 
-- Generated by MATLAB 8.5 and HDL Coder 3.6
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 0.000125
-- Target subsystem base rate: 0.000125
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        0.000125
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- Y                             ce_out        0.000125
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: DUT
-- Source Path: PF/DUT
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY DUT IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        X                                 :   IN    real;  -- double
        ce_out                            :   OUT   std_logic;
        Y                                 :   OUT   real  -- double
        );
END DUT;


ARCHITECTURE rtl OF DUT IS

  -- Component Declarations
  COMPONENT FIRn15semQtz
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          Input                           :   IN    real;  -- double
          Output                          :   OUT   real  -- double
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : FIRn15semQtz
    USE ENTITY work.FIRn15semQtz(rtl);

  -- Signals
  SIGNAL FIRn15semQtz_out1                : real := 0.0;  -- double

BEGIN
  -- Sem quantizacao

  u_FIRn15semQtz : FIRn15semQtz
    PORT MAP( clk => clk,
              reset => reset,
              enb => clk_enable,
              Input => X,  -- double
              Output => FIRn15semQtz_out1  -- double
              );

  ce_out <= clk_enable;

  Y <= FIRn15semQtz_out1;

END rtl;

