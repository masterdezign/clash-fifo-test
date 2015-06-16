module Clocks
  where

import CLaSH.Prelude.Explicit

type System50 = Clk "system" 72
type AD20 = Clk "AD" 180
type DA36 = Clk "DA" 100

system50 :: SClock System50
system50 = sclock

ad20 :: SClock AD20
ad20 = sclock

da36 :: SClock DA36
da36 = sclock
