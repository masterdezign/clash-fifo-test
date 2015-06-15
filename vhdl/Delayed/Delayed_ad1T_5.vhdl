-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Delayed_types.all;

entity Delayed_ad1T_5 is
  port(ds1_i1            : in product10;
       serial_data1_2_i2 : in std_logic_vector(1 downto 0);
       topLet_o          : out product9);
end;

architecture structural of Delayed_ad1T_5 is
  signal repANF_0       : integer;
  signal wild1_1        : integer;
  signal wild1_2        : integer;
  signal b1_3           : std_logic_vector(0 downto 0);
  signal repANF_4       : std_logic_vector(10 downto 0);
  signal a1_5           : std_logic_vector(0 downto 0);
  signal repANF_6       : std_logic_vector(10 downto 0);
  signal i_7            : unsigned(4 downto 0);
  signal bodyVar_8      : boolean;
  signal bodyVar_9      : boolean;
  signal ds2_10         : product5;
  signal altLet_11      : std_logic_vector(11 downto 0);
  signal altLet_12      : std_logic_vector(11 downto 0);
  signal cs_13          : std_logic_vector(19 downto 0);
  signal data2_14       : std_logic_vector(11 downto 0);
  signal data1_15       : std_logic_vector(11 downto 0);
  signal sreg2_16       : std_logic_vector(11 downto 0);
  signal sreg1_17       : std_logic_vector(11 downto 0);
  signal altLet_18      : unsigned(4 downto 0);
  signal subjLet_19     : boolean;
  signal altLet_20      : std_logic_vector(11 downto 0);
  signal altLet_21      : std_logic_vector(11 downto 0);
  signal data2zm_22     : std_logic_vector(11 downto 0);
  signal data1zm_23     : std_logic_vector(11 downto 0);
  signal repANF_24      : std_logic_vector(0 downto 0);
  signal repANF_25      : std_logic_vector(19 downto 0);
  signal repANF_26      : unsigned(4 downto 0);
  signal repANF_27      : std_logic_vector(11 downto 0);
  signal repANF_28      : std_logic_vector(11 downto 0);
  signal repANF_29      : product8;
  signal bodyVar_30     : product10;
  signal bodyVar_31     : product9;
  signal tmp_33         : integer;
  signal tmp_34         : integer;
  signal tmp_35         : std_logic_vector(10 downto 0);
  signal tmp_40         : std_logic_vector(10 downto 0);
  signal tmp_tte_rhs_45 : integer;
  signal tmp_tte_45     : boolean;
  signal tmp_tte_rhs_46 : integer;
  signal tmp_tte_46     : boolean;
  signal tmp_47         : product5;
  signal tmp_58         : std_logic_vector(0 downto 0);
begin
  topLet_o <= bodyVar_31;
  
  repANF_0 <= to_integer(i_7);
  
  tmp_33 <= 1 when repANF_0 = 16 else 0;
  
  wild1_1 <= tmp_33;
  
  tmp_34 <= 1 when repANF_0 < 16 else 0;
  
  wild1_2 <= tmp_34;
  
  b1_3 <= ds2_10.product5_sel1;
  
  slice_n_38 : block
    signal n_39 : std_logic_vector(11 downto 0);
  begin
    n_39 <= sreg2_16;
    tmp_35 <= n_39((10) downto (0));
  end block;
  
  repANF_4 <= tmp_35;
  
  a1_5 <= ds2_10.product5_sel0;
  
  slice_n_43 : block
    signal n_44 : std_logic_vector(11 downto 0);
  begin
    n_44 <= sreg1_17;
    tmp_40 <= n_44((10) downto (0));
  end block;
  
  repANF_6 <= tmp_40;
  
  i_7 <= ds1_i1.product10_sel2;
  
  tmp_tte_rhs_45 <= wild1_1;
  
  tmp_tte_45 <= false when tmp_tte_rhs_45 = 0 else true;
  
  bodyVar_8 <= tmp_tte_45;
  
  tmp_tte_rhs_46 <= wild1_2;
  
  tmp_tte_46 <= false when tmp_tte_rhs_46 = 0 else true;
  
  bodyVar_9 <= tmp_tte_46;
  
  split_n_48: block
    signal n_49 : std_logic_vector(1 downto 0);
  begin
    n_49 <= serial_data1_2_i2;
    tmp_47 <= ( n_49(tmp_47.product5_sel0'left + tmp_47.product5_sel1'length downto
                 tmp_47.product5_sel0'right + tmp_47.product5_sel1'length)
               , n_49(tmp_47.product5_sel1'left downto tmp_47.product5_sel1'right)
               );
  end block;
  
  ds2_10 <= tmp_47;
  
  altLet_11 <= std_logic_vector'(repANF_4) & std_logic_vector'(b1_3);
  
  altLet_12 <= std_logic_vector'(repANF_6) & std_logic_vector'(a1_5);
  
  cs_13 <= ds1_i1.product10_sel5;
  
  data2_14 <= ds1_i1.product10_sel4;
  
  data1_15 <= ds1_i1.product10_sel3;
  
  sreg2_16 <= ds1_i1.product10_sel1;
  
  sreg1_17 <= ds1_i1.product10_sel0;
  
  altLet_18 <= i_7 + unsigned'("00001");
  
  subjLet_19 <= i_7 = (unsigned'("10100") - unsigned'("00001"));
  
  altLet_20 <= altLet_11;
  
  altLet_21 <= altLet_12;
  
  with (bodyVar_8) select
    data2zm_22 <= sreg2_16 when (true),
                  data2_14 when others;
  
  with (bodyVar_8) select
    data1zm_23 <= sreg1_17 when (true),
                  data1_15 when others;
  
  msb_n_59 : block
    signal n_60 : std_logic_vector(19 downto 0);
  begin
    n_61_generate : if n_60'length = 0 generate
    begin
      tmp_58 <= "0";
    end generate;
  
    n_62_generate : if n_60'length /= 0 generate
      n_60 <= cs_13;
      tmp_58 <= n_60(n_60'high downto n_60'high);
    end generate;
  end block;
  
  repANF_24 <= tmp_58;
  
  repANF_25 <= std_logic_vector(rotate_left(unsigned(cs_13),1));
  
  with (subjLet_19) select
    repANF_26 <= unsigned'("00000") when (true),
                 altLet_18 when others;
  
  with (bodyVar_9) select
    repANF_27 <= altLet_20 when (true),
                 sreg2_16 when others;
  
  with (bodyVar_9) select
    repANF_28 <= altLet_21 when (true),
                 sreg1_17 when others;
  
  repANF_29 <= (product8_sel0 => data1zm_23
               ,product8_sel1 => data2zm_22
               ,product8_sel2 => repANF_24);
  
  bodyVar_30 <= (product10_sel0 => repANF_28
                ,product10_sel1 => repANF_27
                ,product10_sel2 => repANF_26
                ,product10_sel3 => data1zm_23
                ,product10_sel4 => data2zm_22
                ,product10_sel5 => repANF_25);
  
  bodyVar_31 <= (product9_sel0 => bodyVar_30
                ,product9_sel1 => repANF_29);
end;
