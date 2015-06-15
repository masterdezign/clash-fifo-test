-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Delayed_types.all;

entity Delayed_fifoT_8 is
  port(eta_i1   : in array_of_std_logic_vector_12(0 to 305);
       eta_i2   : in product3;
       topLet_o : out product6);
end;

architecture structural of Delayed_fifoT_8 is
  signal subjLet_0 : boolean;
  signal altLet_1  : array_of_std_logic_vector_12(0 to 305);
  signal repANF_2  : array_of_std_logic_vector_12(0 to 305);
  signal repANF_3  : std_logic_vector(11 downto 0);
  signal altLet_4  : product6;
  signal x_5       : std_logic_vector(11 downto 0);
  signal d_pulse_6 : std_logic_vector(0 downto 0);
  signal tmp_9     : std_logic_vector(11 downto 0);
begin
  subjLet_0 <= d_pulse_6 = ("1");
  
  Delayed_zuzuzl_9_altLet_1 : entity Delayed_zuzuzl_9
    port map
      (bodyVar_o => altLet_1
      ,eta_i1    => eta_i1
      ,eta_i2    => x_5);
  
  with (subjLet_0) select
    repANF_2 <= altLet_1 when (true),
                eta_i1 when others;
  
  indexVec_n_10 : block
    signal n_11 : array_of_std_logic_vector_12(0 to 305);
    signal n_12 : integer;
  begin
    n_11 <= eta_i1;
    n_12 <= 0;
    -- pragma translate_off
    process (n_11,n_12)
    begin
      if n_12 < n_11'low or n_12 > n_11'high then
        assert false report ("Index: " & integer'image(n_12) & ", is out of bounds: " & integer'image(n_11'low) & " to " & integer'image(n_11'high)) severity warning;
        tmp_9 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_9 <= n_11(n_12);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_3 <= tmp_9;
  
  altLet_4 <= (product6_sel0 => repANF_2
              ,product6_sel1 => repANF_3);
  
  x_5 <= eta_i2.product3_sel0;
  
  d_pulse_6 <= eta_i2.product3_sel1;
  
  topLet_o <= altLet_4;
end;
