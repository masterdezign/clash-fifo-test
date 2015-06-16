-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Delayed_types.all;

entity Delayed_mealyzm_4 is
  port(eta_i1     : in std_logic_vector(1 downto 0);
       -- clock
       AD180      : in std_logic;
       -- asynchronous reset: active low
       AD180_rstn : in std_logic;
       bodyVar_o  : out product12);
end;

architecture structural of Delayed_mealyzm_4 is
  signal y_0       : product12;
  signal bodyVar_1 : product11;
  signal x_2       : product10;
  signal repANF_3  : product10;
  signal x_4       : product10;
  signal tmp_5     : product10;
begin
  bodyVar_o <= y_0;
  
  y_0 <= bodyVar_1.product11_sel1;
  
  Delayed_ad1T_5_bodyVar_1 : entity Delayed_ad1T_5
    port map
      (topLet_o          => bodyVar_1
      ,ds1_i1            => x_2
      ,serial_data1_2_i2 => eta_i1);
  
  register_Delayed_mealyzm_4_n_12 : block
    signal n_13 : product10;
    signal n_14 : product10;
  begin
    n_13 <= (product10_sel0 => std_logic_vector'("000000000000"),product10_sel1 => std_logic_vector'("000000000000"),product10_sel2 => unsigned'("00000"),product10_sel3 => std_logic_vector'("000000000000"),product10_sel4 => std_logic_vector'("000000000000"),product10_sel5 => std_logic_vector'("00000000000000001111"));
  
    process(AD180,AD180_rstn,n_13)
    begin
      if AD180_rstn = '0' then
        n_14 <= n_13;
      elsif rising_edge(AD180) then
        n_14 <= repANF_3;
      end if;
    end process;
  
    tmp_5 <= n_14;
  end block;
  
  x_2 <= tmp_5;
  
  repANF_3 <= x_4;
  
  x_4 <= bodyVar_1.product11_sel0;
end;
