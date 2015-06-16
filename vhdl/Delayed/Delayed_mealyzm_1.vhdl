-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Delayed_types.all;

entity Delayed_mealyzm_1 is
  port(eta_i1     : in product4;
       -- clock
       DA100      : in std_logic;
       -- asynchronous reset: active low
       DA100_rstn : in std_logic;
       bodyVar_o  : out product6);
end;

architecture structural of Delayed_mealyzm_1 is
  signal y_0       : product6;
  signal bodyVar_1 : product5;
  signal x_2       : product3;
  signal repANF_3  : product3;
  signal x_4       : product3;
  signal tmp_5     : product3;
begin
  bodyVar_o <= y_0;
  
  y_0 <= bodyVar_1.product5_sel1;
  
  Delayed_da4T_2_bodyVar_1 : entity Delayed_da4T_2
    port map
      (topLet_o => bodyVar_1
      ,ds_i1    => x_2
      ,ds1_i2   => eta_i1);
  
  register_Delayed_mealyzm_1_n_10 : block
    signal n_11 : product3;
    signal n_12 : product3;
  begin
    n_11 <= (product3_sel0 => unsigned'("000000"),product3_sel1 => std_logic_vector'("00001000000000000000000000000001"),product3_sel2 => std_logic_vector'("000000000000000000000000000000001111"),product3_sel3 => std_logic_vector'("000000000000"));
  
    process(DA100,DA100_rstn,n_11)
    begin
      if DA100_rstn = '0' then
        n_12 <= n_11;
      elsif rising_edge(DA100) then
        n_12 <= repANF_3;
      end if;
    end process;
  
    tmp_5 <= n_12;
  end block;
  
  x_2 <= tmp_5;
  
  repANF_3 <= x_4;
  
  x_4 <= bodyVar_1.product5_sel0;
end;
