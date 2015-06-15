-- The aim of this module is to test CLaSH
-- by implementing AD1-FIFO-DA4 chain @1MHz sampling rate
module Delayed
  where

import qualified Data.List as List
import CLaSH.Prelude
import CLaSH.Prelude.Explicit

import Clocks
import Ad1
import Fifo
import Da4

dPulseT :: Unsigned 7 -> () -> (Unsigned 7, Bit)
dPulseT cnt _ = (cnt', b)
  where
    b | cnt == 0 = 1
      | otherwise = 0
    cnt' | cnt == 49 = 0
         | otherwise = cnt + 1

dPulse :: Signal () -> Signal Bit
dPulse = dPulseT <^> 0

{-# ANN topEntity
  (defTop
    { t_name     = "Proj"
    , t_inputs   = ["ja_data", "sw", "debug_flag"]
    , t_outputs  = ["ja_cs", "jc_cs", "jc_data"]
    }) #-}
topEntity :: (Signal' SClk20 (BitVector 2), Signal (BitVector 2), Signal' SClk36 Bit) -> (Signal' SClk20 Bit, Signal' SClk36 Bit, Signal' SClk36 Bit)
topEntity (ja_data, sw, debug_flag) = (ja_cs, jc_cs, jc_data)
  where
    (b_word', a_word', ja_cs) = ad1 ja_data
    a_word = unsafeSynchronizer sclk systemClock a_word'
    b_word = unsafeSynchronizer sclk systemClock b_word'
    d_pulse = dPulse (signal ())
    delayed' = (fifo d306) (a_word, d_pulse)
    delayed = unsafeSynchronizer systemClock sclk2 delayed'
    (jc_data, jc_cs) = da4 (delayed, debug_flag)
