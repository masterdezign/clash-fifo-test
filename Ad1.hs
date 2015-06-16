module Ad1
  where

import CLaSH.Prelude
import CLaSH.Prelude.Explicit

import Clocks

type OutWord = BitVector 12
type Ad1State = (BitVector 12, BitVector 12, Unsigned 5, OutWord, OutWord, BitVector 20)

-- cs (chip select) is repeating [0, ... 0, 1, 1, 1, 1] (20 cycles)
ad1T :: Ad1State -> BitVector 2 -> (Ad1State, (OutWord, OutWord, Bit))
ad1T (sreg1, sreg2, i, data1, data2, cs) serial_data1_2 = ((sreg1', sreg2', i', data1', data2', cs `rotateL` 1), (data1', data2', msb cs))
  where
    i' | i == fromInteger (natVal cs) - 1 = 0
       | otherwise = i + 1

    (sdata1, sdata2) = unpack serial_data1_2 :: (Bit, Bit)

    sreg1' = update sreg1 sdata1
    sreg2' = update sreg2 sdata2

    data1' = report sreg1 data1
    data2' = report sreg2 data2

    update :: BitVector 12 -> Bit -> BitVector 12
    update reg sdata | (toInteger i) < skip_bits + width = (slice d10 d0 reg) ++# sdata
                     | otherwise = reg

    report :: BitVector 12 -> OutWord -> OutWord
    report reg old_value | (toInteger i) == skip_bits + width = reg
                         | otherwise = old_value

    skip_bits = 4
    width = 12

ad1 :: Signal' AD20 (BitVector 2) -> (Signal' AD20 (OutWord), Signal' AD20 (OutWord), Signal' AD20 Bit)
ad1 = mealyB' ad20 ad1T (0, 0, 0, 0, 0, cs_waveform)
  where cs_waveform = $$(bLit "00000000000000001111") :: BitVector 20
