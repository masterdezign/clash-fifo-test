-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Delayed_types.all;

entity Delayed_mealyzm_1 is
  port(eta_i1        : in product3;
       -- clock
       sclk1389      : in std_logic;
       -- asynchronous reset: active low
       sclk1389_rstn : in std_logic;
       bodyVar_o     : out product5);
end;

architecture structural of Delayed_mealyzm_1 is
  signal y_0       : product5;
  signal bodyVar_1 : product4;
  signal x_2       : product2;
  signal repANF_3  : product2;
  signal x_4       : product2;
  signal tmp_5     : product2;
begin
  bodyVar_o <= y_0;
  
  y_0 <= bodyVar_1.product4_sel1;
  
  Delayed_da4T_2_bodyVar_1 : entity Delayed_da4T_2
    port map
      (topLet_o => bodyVar_1
      ,ds_i1    => x_2
      ,ds1_i2   => eta_i1);
  
  register_Delayed_mealyzm_1_n_10 : block
    signal n_11 : product2;
    signal n_12 : product2;
  begin
    n_11 <= (product2_sel0 => unsigned'("000000"),product2_sel1 => std_logic_vector'("00001000000000000000000000000001"),product2_sel2 => std_logic_vector'("000000000000000000000000000000001111"),product2_sel3 => std_logic_vector'("000000000000"));
  
    process(sclk1389,sclk1389_rstn,n_11)
    begin
      if sclk1389_rstn = '0' then
        n_12 <= n_11;
      elsif rising_edge(sclk1389) then
        n_12 <= repANF_3;
      end if;
    end process;
  
    tmp_5 <= n_12;
  end block;
  
  x_2 <= tmp_5;
  
  repANF_3 <= x_4;
  
  x_4 <= bodyVar_1.product4_sel0;
end;
