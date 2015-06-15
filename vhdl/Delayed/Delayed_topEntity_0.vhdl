-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Delayed_types.all;

entity Delayed_topEntity_0 is
  port(ds_i1           : in product0;
       -- clock
       sclk1389        : in std_logic;
       -- asynchronous reset: active low
       sclk1389_rstn   : in std_logic;
       -- clock
       sclk2500        : in std_logic;
       -- asynchronous reset: active low
       sclk2500_rstn   : in std_logic;
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       topLet_o        : out product1);
end;

architecture structural of Delayed_topEntity_0 is
  signal bodyVar_0     : product1;
  signal repANF_1      : std_logic_vector(0 downto 0);
  signal repANF_2      : std_logic_vector(0 downto 0);
  signal repANF_3      : std_logic_vector(0 downto 0);
  signal tup_4         : product5;
  signal w1_5          : product8;
  signal x_6           : std_logic_vector(0 downto 0);
  signal y_7           : std_logic_vector(0 downto 0);
  signal x_8           : std_logic_vector(0 downto 0);
  signal bodyVar_9     : product3;
  signal ja_data_10    : std_logic_vector(1 downto 0);
  signal x_11          : std_logic_vector(11 downto 0);
  signal debug_flag_12 : std_logic_vector(0 downto 0);
  signal repANF_13     : std_logic_vector(11 downto 0);
  signal repANF_14     : product3;
  signal repANF_15     : std_logic_vector(11 downto 0);
  signal repANF_16     : std_logic_vector(0 downto 0);
  signal repANF_17     : std_logic_vector(11 downto 0);
  signal x_18          : std_logic_vector(11 downto 0);
begin
  bodyVar_0 <= (product1_sel0 => repANF_1
               ,product1_sel1 => repANF_2
               ,product1_sel2 => repANF_3);
  
  repANF_1 <= x_6;
  
  repANF_2 <= y_7;
  
  repANF_3 <= x_8;
  
  Delayed_mealyzm_1_tup_4 : entity Delayed_mealyzm_1
    port map
      (bodyVar_o     => tup_4
      ,sclk1389      => sclk1389
      ,sclk1389_rstn => sclk1389_rstn
      ,eta_i1        => bodyVar_9);
  
  Delayed_mealyzm_4_w1_5 : entity Delayed_mealyzm_4
    port map
      (bodyVar_o     => w1_5
      ,sclk2500      => sclk2500
      ,sclk2500_rstn => sclk2500_rstn
      ,eta_i1        => ja_data_10);
  
  x_6 <= w1_5.product8_sel2;
  
  y_7 <= tup_4.product5_sel1;
  
  x_8 <= tup_4.product5_sel0;
  
  bodyVar_9 <= (product3_sel0 => x_11
               ,product3_sel1 => debug_flag_12);
  
  ja_data_10 <= ds_i1.product0_sel0;
  
  x_11 <= repANF_13;
  
  debug_flag_12 <= ds_i1.product0_sel2;
  
  Delayed_fifo1_6_repANF_13 : entity Delayed_fifo1_6
    port map
      (topLet_o        => repANF_13
      ,system1000      => system1000
      ,system1000_rstn => system1000_rstn
      ,eta_i1          => repANF_14);
  
  repANF_14 <= (product3_sel0 => repANF_15
               ,product3_sel1 => repANF_16);
  
  repANF_15 <= repANF_17;
  
  Delayed_mealyzm_10_repANF_16 : entity Delayed_mealyzm_10
    port map
      (bodyVar_o       => repANF_16
      ,system1000      => system1000
      ,system1000_rstn => system1000_rstn);
  
  repANF_17 <= x_18;
  
  x_18 <= w1_5.product8_sel1;
  
  topLet_o <= bodyVar_0;
end;
