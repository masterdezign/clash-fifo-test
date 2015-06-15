-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Delayed_types.all;

entity Proj is
  port(ja_data         : in std_logic_vector(1 downto 0);
       sw              : in std_logic_vector(1 downto 0);
       debug_flag      : in std_logic_vector(0 downto 0);
       -- clock
       sclk1389        : in std_logic;
       -- asynchronous reset: active low
       sclk1389_rstn   : in std_logic;
       -- clock
       sclk2500        : in std_logic;
       -- asynchronous reset: active low
       sclk2500_rstn   : in std_logic;
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       ja_cs           : out std_logic_vector(0 downto 0);
       jc_cs           : out std_logic_vector(0 downto 0);
       jc_data         : out std_logic_vector(0 downto 0));
end;

architecture structural of Proj is
  signal sclk1389        : std_logic;
  signal sclk1389_rstn   : std_logic;
  signal sclk2500        : std_logic;
  signal sclk2500_rstn   : std_logic;
  signal system1000      : std_logic;
  signal system1000_rstn : std_logic;
  signal input_0         : product0;
  signal output_0        : product1;
begin
  input_0 <= (product0_sel0 => ja_data
             ,product0_sel1 => sw
             ,product0_sel2 => debug_flag);
  
  Delayed_topEntity_0_inst : entity Delayed_topEntity_0
    port map
      (ds_i1           => input_0
      ,sclk1389        => sclk1389
      ,sclk1389_rstn   => sclk1389_rstn
      ,sclk2500        => sclk2500
      ,sclk2500_rstn   => sclk2500_rstn
      ,system1000      => system1000
      ,system1000_rstn => system1000_rstn
      ,topLet_o        => output_0);
  
  ja_cs <= output_0.product1_sel0;
  
  jc_cs <= output_0.product1_sel1;
  
  jc_data <= output_0.product1_sel2;
end;
