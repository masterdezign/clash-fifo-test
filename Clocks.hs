module Clocks
  where

import CLaSH.Prelude.Explicit

-- System clock Clk @50 MHz
--

-- AD1 clock @20 MHz
type SClk20  = Clk "sclk" 2500
sclk :: SClock SClk20
sclk = sclock

-- DA4 clock @36 MHz
type SClk36  = Clk "sclk" 1389
sclk2 :: SClock SClk36
sclk2 = sclock
