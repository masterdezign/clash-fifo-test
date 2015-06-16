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

dPulse :: Signal' System50 () -> Signal' System50 Bit
dPulse = mealyB' system50 dPulseT 0

burstSignal :: Signal' System50 Bit -> Signal' System50 (BitVector 12)
burstSignal = mealyB' system50 burstSignalT 0

burstSignalT :: BitVector 12 -> Bit -> (BitVector 12, BitVector 12)
burstSignalT cnt d_pulse = (cnt', cnt)
  where
    cnt' | d_pulse == high = cnt + 1
         | otherwise = cnt

{-# ANN topEntity
  (defTop
    { t_name     = "Proj"
    , t_inputs   = ["ja_data", "sw", "debug_flag"]
    , t_outputs  = ["ja_cs", "jc_cs", "jc_data"]
    }) #-}
topEntity :: (Signal' AD20 (BitVector 2), Signal' System50 (BitVector 2), Signal' DA36 Bit) -> (Signal' AD20 Bit, Signal' DA36 Bit, Signal' DA36 Bit)
topEntity (ja_data, sw, debug_flag) = (ja_cs, jc_cs, jc_data)
  where
    (b_word', a_word', ja_cs) = ad1 ja_data
    a_word = unsafeSynchronizer ad20 system50 a_word'
    b_word = unsafeSynchronizer ad20 system50 b_word'
    d_pulse = dPulse (signal ())
    delayed' = (fifo d306) (a_word, d_pulse)
    delayed = unsafeSynchronizer system50 da36 delayed'
    (jc_data, jc_cs) = da4 (delayed, debug_flag)
