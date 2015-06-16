-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Delayed_types.all;

entity Proj is
  port(ja_data       : in std_logic_vector(1 downto 0);
       sw            : in std_logic_vector(1 downto 0);
       debug_flag    : in std_logic_vector(0 downto 0);
       -- clock
       AD180         : in std_logic;
       -- asynchronous reset: active low
       AD180_rstn    : in std_logic;
       -- clock
       DA100         : in std_logic;
       -- asynchronous reset: active low
       DA100_rstn    : in std_logic;
       -- clock
       system72      : in std_logic;
       -- asynchronous reset: active low
       system72_rstn : in std_logic;
       ja_cs         : out std_logic_vector(0 downto 0);
       jc_cs         : out std_logic_vector(0 downto 0);
       jc_data       : out std_logic_vector(0 downto 0));
end;

architecture structural of Proj is
  signal AD180         : std_logic;
  signal AD180_rstn    : std_logic;
  signal DA100         : std_logic;
  signal DA100_rstn    : std_logic;
  signal system72      : std_logic;
  signal system72_rstn : std_logic;
  signal input_0       : product0;
  signal output_0      : product1;
begin
  input_0 <= (product0_sel0 => ja_data
             ,product0_sel1 => sw
             ,product0_sel2 => debug_flag);
  
  Delayed_topEntity_0_inst : entity Delayed_topEntity_0
    port map
      (ds_i1         => input_0
      ,AD180         => AD180
      ,AD180_rstn    => AD180_rstn
      ,DA100         => DA100
      ,DA100_rstn    => DA100_rstn
      ,system72      => system72
      ,system72_rstn => system72_rstn
      ,topLet_o      => output_0);
  
  ja_cs <= output_0.product1_sel0;
  
  jc_cs <= output_0.product1_sel1;
  
  jc_data <= output_0.product1_sel2;
end;
