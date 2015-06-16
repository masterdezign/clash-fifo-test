-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Delayed_types.all;

entity Delayed_testbench is
  port(done : out boolean);
end;

architecture structural of Delayed_testbench is
  signal finished      : boolean;
  signal AD180         : std_logic;
  signal DA100         : std_logic;
  signal system72      : std_logic;
  signal AD180_rstn    : std_logic;
  signal DA100_rstn    : std_logic;
  signal system72_rstn : std_logic;
  signal ds_i1         : product0;
  signal topLet_o      : product1;
begin
  done <= finished;
  
  -- pragma translate_off
  process is
  begin
    AD180 <= '0';
    wait for 2 ns;
    while (not finished) loop
      AD180 <= not AD180;
      wait for 90 ns;
      AD180 <= not AD180;
      wait for 90 ns;
    end loop;
    wait;
  end process;
  -- pragma translate_on
  
  -- pragma translate_off
  process is
  begin
    DA100 <= '0';
    wait for 2 ns;
    while (not finished) loop
      DA100 <= not DA100;
      wait for 50 ns;
      DA100 <= not DA100;
      wait for 50 ns;
    end loop;
    wait;
  end process;
  -- pragma translate_on
  
  -- pragma translate_off
  process is
  begin
    system72 <= '0';
    wait for 2 ns;
    while (not finished) loop
      system72 <= not system72;
      wait for 36 ns;
      system72 <= not system72;
      wait for 36 ns;
    end loop;
    wait;
  end process;
  -- pragma translate_on
  
  -- pragma translate_off
  AD180_rstn <= '0',
             '1' after 1 ns;
  -- pragma translate_on
  
  -- pragma translate_off
  DA100_rstn <= '0',
             '1' after 1 ns;
  -- pragma translate_on
  
  -- pragma translate_off
  system72_rstn <= '0',
             '1' after 1 ns;
  -- pragma translate_on
  
  totest : entity Delayed_topEntity_0
    port map
      (AD180         => AD180
      ,DA100         => DA100
      ,system72      => system72
      ,AD180_rstn    => AD180_rstn
      ,DA100_rstn    => DA100_rstn
      ,system72_rstn => system72_rstn
      ,ds_i1         => ds_i1
      ,topLet_o      => topLet_o);
  
  ds_i1 <= ((others => 'X'),(others => 'X'),(others => 'X'));
  
  finished <=
  -- pragma translate_off
              false,
  -- pragma translate_on
              true
  -- pragma translate_off
              after 100 ns
  -- pragma translate_on
              ;
end;
