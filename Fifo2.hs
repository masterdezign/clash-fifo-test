module Fifo2
  where

import CLaSH.Prelude
import CLaSH.Prelude.Explicit

import Clocks

type Word12 = BitVector 12

-- | Increases FIFO pointer i. If the maximum index is reached, resets it to zero.
g :: (KnownNat n, Eq a, Num a) => SNat n -> a -> a
g depth i = i'
  where
    i' | i == max_i = 0
       | otherwise = i + 1
    max_i = fromInteger (natVal depth) - 1

fifo :: KnownNat n => SNat n -> (Signal' System50 Word12, Signal' System50 Bool) -> Signal' System50 Word12
fifo depth (x,d_pulse) = x'
  where
    -- FIFO pointer. It is increased only when d_pulse is True
    i :: Signal' System50 (Unsigned 9)
    i = regEn' system50 0 d_pulse ((g depth) `fmap` i)
    x' = bram i i d_pulse x
    bram = blockRam' system50 (replicate depth 0)
