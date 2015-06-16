-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Delayed_types.all;

entity Delayed_da4T_2 is
  port(ds_i1    : in product3;
       ds1_i2   : in product4;
       topLet_o : out product5);
end;

architecture structural of Delayed_da4T_2 is
  signal burst_signal_0 : std_logic_vector(11 downto 0);
  signal cs_1           : std_logic_vector(35 downto 0);
  signal cmd1_2         : std_logic_vector(31 downto 0);
  signal i_3            : unsigned(5 downto 0);
  signal altLet_4       : product5;
  signal debug_flag_5   : std_logic_vector(0 downto 0);
  signal data1_6        : std_logic_vector(11 downto 0);
  signal altLet_7       : product5;
  signal repANF_8       : product6;
  signal repANF_9       : std_logic_vector(0 downto 0);
  signal repANF_10      : std_logic_vector(0 downto 0);
  signal repANF_11      : product3;
  signal repANF_12      : std_logic_vector(11 downto 0);
  signal altLet_13      : std_logic_vector(11 downto 0);
  signal altLet_14      : std_logic_vector(11 downto 0);
  signal subjLet_15     : boolean;
  signal altLet_16      : std_logic_vector(11 downto 0);
  signal subjLet_17     : boolean;
  signal repANF_18      : std_logic_vector(35 downto 0);
  signal repANF_19      : std_logic_vector(31 downto 0);
  signal altLet_20      : std_logic_vector(31 downto 0);
  signal altLet_21      : std_logic_vector(31 downto 0);
  signal subjLet_22     : boolean;
  signal altLet_23      : std_logic_vector(31 downto 0);
  signal altLet_24      : std_logic_vector(31 downto 0);
  signal subjLet_25     : boolean;
  signal repANF_26      : unsigned(5 downto 0);
  signal altLet_27      : unsigned(5 downto 0);
  signal subjLet_28     : boolean;
  signal tmp_29         : std_logic_vector(0 downto 0);
  signal tmp_34         : std_logic_vector(0 downto 0);
begin
  topLet_o <= altLet_4;
  
  burst_signal_0 <= ds_i1.product3_sel3;
  
  cs_1 <= ds_i1.product3_sel2;
  
  cmd1_2 <= ds_i1.product3_sel1;
  
  i_3 <= ds_i1.product3_sel0;
  
  altLet_4 <= altLet_7;
  
  debug_flag_5 <= ds1_i2.product4_sel1;
  
  data1_6 <= ds1_i2.product4_sel0;
  
  altLet_7 <= (product5_sel0 => repANF_11
              ,product5_sel1 => repANF_8);
  
  repANF_8 <= (product6_sel0 => repANF_10
              ,product6_sel1 => repANF_9);
  
  msb_n_30 : block
    signal n_31 : std_logic_vector(35 downto 0);
  begin
    n_32_generate : if n_31'length = 0 generate
    begin
      tmp_29 <= "0";
    end generate;
  
    n_33_generate : if n_31'length /= 0 generate
      n_31 <= cs_1;
      tmp_29 <= n_31(n_31'high downto n_31'high);
    end generate;
  end block;
  
  repANF_9 <= tmp_29;
  
  msb_n_35 : block
    signal n_36 : std_logic_vector(31 downto 0);
  begin
    n_37_generate : if n_36'length = 0 generate
    begin
      tmp_34 <= "0";
    end generate;
  
    n_38_generate : if n_36'length /= 0 generate
      n_36 <= cmd1_2;
      tmp_34 <= n_36(n_36'high downto n_36'high);
    end generate;
  end block;
  
  repANF_10 <= tmp_34;
  
  repANF_11 <= (product3_sel0 => repANF_26
               ,product3_sel1 => repANF_19
               ,product3_sel2 => repANF_18
               ,product3_sel3 => repANF_12);
  
  with (subjLet_17) select
    repANF_12 <= altLet_13 when (true),
                 altLet_14 when others;
  
  with (subjLet_15) select
    altLet_13 <= std_logic_vector'("000000000000") when (true),
                 altLet_14 when others;
  
  with (subjLet_17) select
    altLet_14 <= altLet_16 when (true),
                 burst_signal_0 when others;
  
  subjLet_15 <= burst_signal_0 = std_logic_vector'("000001111111");
  
  altLet_16 <= std_logic_vector(unsigned(burst_signal_0) + unsigned(std_logic_vector'("000000000001")));
  
  subjLet_17 <= i_3 = unsigned'("000000");
  
  repANF_18 <= std_logic_vector(rotate_left(unsigned(cs_1),1));
  
  with (subjLet_22) select
    repANF_19 <= altLet_20 when (true),
                 altLet_21 when others;
  
  altLet_20 <= std_logic_vector(rotate_left(unsigned(cmd1_2),1));
  
  with (subjLet_25) select
    altLet_21 <= altLet_23 when (true),
                 altLet_24 when others;
  
  subjLet_22 <= i_3 /= (unsigned'("100100") - unsigned'("000001"));
  
  Delayed_da4T6_3_altLet_23 : entity Delayed_da4T6_3
    port map
      (topLet_o    => altLet_23
      ,dataBits_i1 => data1_6);
  
  Delayed_da4T6_3_altLet_24 : entity Delayed_da4T6_3
    port map
      (topLet_o    => altLet_24
      ,dataBits_i1 => burst_signal_0);
  
  subjLet_25 <= debug_flag_5 = ("0");
  
  with (subjLet_28) select
    repANF_26 <= unsigned'("000000") when (true),
                 altLet_27 when others;
  
  altLet_27 <= i_3 + unsigned'("000001");
  
  subjLet_28 <= i_3 = (unsigned'("100100") - unsigned'("000001"));
end;
