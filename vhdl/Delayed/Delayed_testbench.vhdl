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
  signal finished        : boolean;
  signal sclk1389        : std_logic;
  signal sclk2500        : std_logic;
  signal system1000      : std_logic;
  signal sclk1389_rstn   : std_logic;
  signal sclk2500_rstn   : std_logic;
  signal system1000_rstn : std_logic;
  signal ds_i1           : product0;
  signal topLet_o        : product1;
begin
  done <= finished;
  
  -- pragma translate_off
  process is
  begin
    sclk1389 <= '0';
    wait for 2 ns;
    while (not finished) loop
      sclk1389 <= not sclk1389;
      wait for 694 ns;
      sclk1389 <= not sclk1389;
      wait for 695 ns;
    end loop;
    wait;
  end process;
  -- pragma translate_on
  
  -- pragma translate_off
  process is
  begin
    sclk2500 <= '0';
    wait for 2 ns;
    while (not finished) loop
      sclk2500 <= not sclk2500;
      wait for 1250 ns;
      sclk2500 <= not sclk2500;
      wait for 1250 ns;
    end loop;
    wait;
  end process;
  -- pragma translate_on
  
  -- pragma translate_off
  process is
  begin
    system1000 <= '0';
    wait for 2 ns;
    while (not finished) loop
      system1000 <= not system1000;
      wait for 500 ns;
      system1000 <= not system1000;
      wait for 500 ns;
    end loop;
    wait;
  end process;
  -- pragma translate_on
  
  -- pragma translate_off
  sclk1389_rstn <= '0',
             '1' after 1 ns;
  -- pragma translate_on
  
  -- pragma translate_off
  sclk2500_rstn <= '0',
             '1' after 1 ns;
  -- pragma translate_on
  
  -- pragma translate_off
  system1000_rstn <= '0',
             '1' after 1 ns;
  -- pragma translate_on
  
  totest : entity Delayed_topEntity_0
    port map
      (sclk1389        => sclk1389
      ,sclk2500        => sclk2500
      ,system1000      => system1000
      ,sclk1389_rstn   => sclk1389_rstn
      ,sclk2500_rstn   => sclk2500_rstn
      ,system1000_rstn => system1000_rstn
      ,ds_i1           => ds_i1
      ,topLet_o        => topLet_o);
  
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
