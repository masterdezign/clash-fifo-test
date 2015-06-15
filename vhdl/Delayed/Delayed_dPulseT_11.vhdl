-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Delayed_types.all;

entity Delayed_dPulseT_11 is
  port(pTS_i1   : in unsigned(6 downto 0);
       topLet_o : out product7);
end;

architecture structural of Delayed_dPulseT_11 is
  signal subjLet_0 : boolean;
  signal altLet_1  : unsigned(6 downto 0);
  signal repANF_2  : unsigned(6 downto 0);
  signal subjLet_3 : boolean;
  signal repANF_4  : std_logic_vector(0 downto 0);
begin
  subjLet_0 <= pTS_i1 = unsigned'("0110001");
  
  altLet_1 <= pTS_i1 + unsigned'("0000001");
  
  with (subjLet_0) select
    repANF_2 <= unsigned'("0000000") when (true),
                altLet_1 when others;
  
  subjLet_3 <= pTS_i1 = unsigned'("0000000");
  
  with (subjLet_3) select
    repANF_4 <= std_logic_vector'("1") when (true),
                std_logic_vector'("0") when others;
  
  topLet_o <= (product7_sel0 => repANF_2
              ,product7_sel1 => repANF_4);
end;
