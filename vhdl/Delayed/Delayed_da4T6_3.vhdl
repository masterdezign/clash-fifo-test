-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Delayed_types.all;

entity Delayed_da4T6_3 is
  port(dataBits_i1 : in std_logic_vector(11 downto 0);
       topLet_o    : out std_logic_vector(31 downto 0));
end;

architecture structural of Delayed_da4T6_3 is
  signal repANF_0 : std_logic_vector(23 downto 0);
  signal repANF_1 : std_logic_vector(27 downto 0);
begin
  repANF_0 <= std_logic_vector'((std_logic_vector'(std_logic_vector'("0000")) & std_logic_vector'(std_logic_vector'("00111111")))) & std_logic_vector'(dataBits_i1);
  
  repANF_1 <= std_logic_vector'(repANF_0) & std_logic_vector'(std_logic_vector'("0000"));
  
  topLet_o <= std_logic_vector'(repANF_1) & std_logic_vector'(std_logic_vector'("0000"));
end;
