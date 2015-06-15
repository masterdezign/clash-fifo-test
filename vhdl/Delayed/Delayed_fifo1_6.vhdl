-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Delayed_types.all;

entity Delayed_fifo1_6 is
  port(eta_i1          : in product3;
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       topLet_o        : out std_logic_vector(11 downto 0));
end;

architecture structural of Delayed_fifo1_6 is
  signal bodyVar_0 : product3;
  signal x_1       : std_logic_vector(11 downto 0);
  signal x_2       : std_logic_vector(0 downto 0);
  signal x_3       : std_logic_vector(11 downto 0);
  signal y_4       : std_logic_vector(0 downto 0);
begin
  bodyVar_0 <= (product3_sel0 => x_1
               ,product3_sel1 => x_2);
  
  x_1 <= x_3;
  
  x_2 <= y_4;
  
  x_3 <= eta_i1.product3_sel0;
  
  y_4 <= eta_i1.product3_sel1;
  
  Delayed_mealyzm_7_topLet_o : entity Delayed_mealyzm_7
    port map
      (bodyVar_o       => topLet_o
      ,system1000      => system1000
      ,system1000_rstn => system1000_rstn
      ,eta_i1          => bodyVar_0);
end;
