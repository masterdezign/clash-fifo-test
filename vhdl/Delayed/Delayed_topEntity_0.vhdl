-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Delayed_types.all;

entity Delayed_topEntity_0 is
  port(ds_i1         : in product0;
       -- clock
       AD180         : in std_logic;
       -- asynchronous reset: active low
       AD180_rstn    : in std_logic;
       -- clock
       DA100         : in std_logic;
       -- asynchronous reset: active low
       DA100_rstn    : in std_logic;
       -- clock
       system72      : in std_logic;
       -- asynchronous reset: active low
       system72_rstn : in std_logic;
       topLet_o      : out product1);
end;

architecture structural of Delayed_topEntity_0 is
  signal bodyVar_0     : product1;
  signal repANF_1      : std_logic_vector(0 downto 0);
  signal repANF_2      : std_logic_vector(0 downto 0);
  signal repANF_3      : std_logic_vector(0 downto 0);
  signal tup_4         : product6;
  signal w1_5          : product12;
  signal x_6           : std_logic_vector(0 downto 0);
  signal y_7           : std_logic_vector(0 downto 0);
  signal x_8           : std_logic_vector(0 downto 0);
  signal bodyVar_9     : product4;
  signal ja_data_10    : std_logic_vector(1 downto 0);
  signal x_11          : std_logic_vector(11 downto 0);
  signal debug_flag_12 : std_logic_vector(0 downto 0);
  signal repANF_13     : std_logic_vector(11 downto 0);
  signal bodyVar_14    : product4;
  signal repANF_15     : std_logic_vector(0 downto 0);
  signal x_16          : std_logic_vector(11 downto 0);
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
      (bodyVar_o  => tup_4
      ,DA100      => DA100
      ,DA100_rstn => DA100_rstn
      ,eta_i1     => bodyVar_9);
  
  Delayed_mealyzm_4_w1_5 : entity Delayed_mealyzm_4
    port map
      (bodyVar_o  => w1_5
      ,AD180      => AD180
      ,AD180_rstn => AD180_rstn
      ,eta_i1     => ja_data_10);
  
  x_6 <= w1_5.product12_sel2;
  
  y_7 <= tup_4.product6_sel1;
  
  x_8 <= tup_4.product6_sel0;
  
  bodyVar_9 <= (product4_sel0 => x_11
               ,product4_sel1 => debug_flag_12);
  
  ja_data_10 <= ds_i1.product0_sel0;
  
  x_11 <= repANF_13;
  
  debug_flag_12 <= ds_i1.product0_sel2;
  
  Delayed_mealyzm_6_repANF_13 : entity Delayed_mealyzm_6
    port map
      (bodyVar_o     => repANF_13
      ,system72      => system72
      ,system72_rstn => system72_rstn
      ,eta_i1        => bodyVar_14);
  
  bodyVar_14 <= (product4_sel0 => x_16
                ,product4_sel1 => repANF_15);
  
  Delayed_mealyzm_9_repANF_15 : entity Delayed_mealyzm_9
    port map
      (bodyVar_o     => repANF_15
      ,system72      => system72
      ,system72_rstn => system72_rstn);
  
  x_16 <= repANF_17;
  
  repANF_17 <= x_18;
  
  x_18 <= w1_5.product12_sel1;
  
  topLet_o <= bodyVar_0;
end;
