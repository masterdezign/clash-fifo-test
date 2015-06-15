module Fifo
  where

import CLaSH.Prelude


fifoT :: KnownNat n => (Vec n (BitVector 12)) -> (BitVector 12, Bit) -> (Vec n (BitVector 12), BitVector 12)
fifoT mem (x, d_pulse) = (mem', x')
  where x' = mem !! 0
        mem' | d_pulse == high = mem <<+ x
             | otherwise = mem

fifo :: KnownNat n => SNat n -> (Signal (BitVector 12), Signal Bit) -> Signal (BitVector 12)
fifo depth = fifoT <^> (replicate depth 0)
