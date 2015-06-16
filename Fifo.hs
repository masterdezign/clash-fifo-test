module Fifo
  where

import CLaSH.Prelude
import CLaSH.Prelude.Explicit

import Clocks

fifoT :: KnownNat n => (Vec n (BitVector 12)) -> (BitVector 12, Bit) -> (Vec n (BitVector 12), BitVector 12)
fifoT mem (x, d_pulse) = (mem', x')
  where x' = mem !! 0
        mem' | d_pulse == high = mem <<+ x
             | otherwise = mem

fifo :: KnownNat n => SNat n -> (Signal' System50 (BitVector 12), Signal' System50 Bit) -> Signal' System50 (BitVector 12)
fifo depth = mealyB' system50 fifoT (replicate depth 0)
