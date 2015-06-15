-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Delayed_types.all;

entity Delayed_mealyzm_7 is
  port(eta_i1          : in product3;
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       bodyVar_o       : out std_logic_vector(11 downto 0));
end;

architecture structural of Delayed_mealyzm_7 is
  signal y_0       : std_logic_vector(11 downto 0);
  signal bodyVar_1 : product6;
  signal x_2       : array_of_std_logic_vector_12(0 to 305);
  signal repANF_3  : array_of_std_logic_vector_12(0 to 305);
  signal x_4       : array_of_std_logic_vector_12(0 to 305);
  signal tmp_5     : array_of_std_logic_vector_12(0 to 305);
begin
  bodyVar_o <= y_0;
  
  y_0 <= bodyVar_1.product6_sel1;
  
  Delayed_fifoT_8_bodyVar_1 : entity Delayed_fifoT_8
    port map
      (topLet_o => bodyVar_1
      ,eta_i1   => x_2
      ,eta_i2   => eta_i1);
  
  register_Delayed_mealyzm_7_n_9 : block
    signal n_10 : array_of_std_logic_vector_12(0 to 305);
    signal n_11 : array_of_std_logic_vector_12(0 to 305);
  begin
    n_10 <= (array_of_std_logic_vector_12'(0 to (306)-1 => std_logic_vector'("000000000000")));
  
    process(system1000,system1000_rstn,n_10)
    begin
      if system1000_rstn = '0' then
        n_11 <= n_10;
      elsif rising_edge(system1000) then
        n_11 <= repANF_3;
      end if;
    end process;
  
    tmp_5 <= n_11;
  end block;
  
  x_2 <= tmp_5;
  
  repANF_3 <= x_4;
  
  x_4 <= bodyVar_1.product6_sel0;
end;
