module Da4
  where

import qualified Data.List as L
import CLaSH.Prelude
import CLaSH.Prelude.Explicit

import Clocks

type Da4State = (Unsigned 6, BitVector 32, BitVector 36, BitVector 12)

da4T :: Da4State -> (BitVector 12, Bit) -> (Da4State, (Bit, Bit))
da4T (i, cmd1, cs, burst_signal) (data1, debug_flag) =
  ((i', cmd1', cs `rotateL` 1, burst_signal'), (msb cmd1, msb cs))
  where
    i' | i == max_i = 0
       | otherwise = i + 1

    cmd1' | i /= max_i = cmd1 `rotateL` 1
          | debug_flag == low = makeCommand data1
          | otherwise = makeCommand burst_signal

    burst_signal' | i == 0 && burst_signal == 127 = 0
                  | i == 0 = burst_signal + 1
                  | otherwise = burst_signal

    makeCommand dataBits = void4 ++# command0 ++# dataBits ++# void4 ++# void4
      where void4 = $$(bLit "0000") :: BitVector 4
            command0 = $$(bLit "00111111") :: BitVector 8

    max_i = fromInteger (natVal cs) - 1

-- | Controller of digital to analog converter.
da4 :: (Signal' SClk36 (BitVector 12), Signal' SClk36 Bit) -> (Signal' SClk36 Bit, Signal' SClk36 Bit)
da4 = mealyB' sclk2 da4T (0, poweronCommand, cs_waveform, 0)
  where
    cs_waveform = $$(bLit ((L.replicate 32 '0') L.++ (L.replicate 4 '1'))) :: BitVector 36
    poweronCommand = $$(bLit "00001000000000000000000000000001") :: BitVector 32
