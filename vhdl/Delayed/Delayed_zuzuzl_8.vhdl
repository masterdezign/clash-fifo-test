-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Delayed_types.all;

entity Delayed_zuzuzl_8 is
  port(eta_i1    : in array_of_std_logic_vector_12(0 to 305);
       eta_i2    : in std_logic_vector(11 downto 0);
       bodyVar_o : out array_of_std_logic_vector_12(0 to 305));
end;

architecture structural of Delayed_zuzuzl_8 is
  signal ds_0     : product8;
  signal x_1      : array_of_std_logic_vector_12(0 to 305);
  signal repANF_2 : array_of_std_logic_vector_12(0 to 305);
  signal repANF_3 : array_of_std_logic_vector_12(0 to 0);
  signal ds_4     : product9;
  signal zsR_5    : array_of_std_logic_vector_12(0 to 305);
  signal zsL_6    : array_of_std_logic_vector_12(0 to 0);
  signal repANF_7 : array_of_std_logic_vector_12(0 to 306);
  signal repANF_8 : array_of_std_logic_vector_12(0 to 0);
  signal tmp_9    : product9;
begin
  bodyVar_o <= x_1;
  
  ds_0 <= (product8_sel0 => repANF_2
          ,product8_sel1 => repANF_3);
  
  x_1 <= ds_0.product8_sel0;
  
  repANF_2 <= zsR_5;
  
  repANF_3 <= zsL_6;
  
  splitAt_n_11 : block
    signal n_12 : array_of_std_logic_vector_12(0 to 306);
  begin
    n_12 <= repANF_7;
    tmp_9 <= (n_12(tmp_9.product9_sel0'left to tmp_9.product9_sel0'right)
               ,n_12(tmp_9.product9_sel1'left + tmp_9.product9_sel0'length to tmp_9.product9_sel1'right + tmp_9.product9_sel0'length));
  end block;
  
  ds_4 <= tmp_9;
  
  zsR_5 <= ds_4.product9_sel1;
  
  zsL_6 <= ds_4.product9_sel0;
  
  repANF_7 <= array_of_std_logic_vector_12'(eta_i1) & array_of_std_logic_vector_12'(repANF_8);
  
  repANF_8 <= array_of_std_logic_vector_12'(0 => eta_i2);
end;
