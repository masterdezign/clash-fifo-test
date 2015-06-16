module Test.Fifo
  where

import CLaSH.Prelude
import CLaSH.Prelude.Explicit

import Clocks
import Fifo

topEntity :: (Signal' System50 (BitVector 12), Signal' System50 Bit) -> Signal' System50 (BitVector 12)
topEntity x = (fifo d4) x

testInput :: Signal' System50 (BitVector 12, Bit)
testInput = stimuliGenerator' system50 $(v [(2::BitVector 12, high :: Bit)
                                            , (0, low)
                                            , (-2, high)
                                            , (0, low)
                                            , (2047, high)
                                            , (0, low)
                                            , (-2047, high)
                                            , (0, low)
                                            , (2048, high)
                                            , (0, low)
                                            , (0, high)
                                            , (0, low)
                                            , (0, high)
                                            , (0, low)
                                            , (0, high)
                                            , (0, low)
                                            , (0, high)
                                            , (0, low)
                                            , (0, high) ])

expectedOutput :: Signal' System50 (BitVector 12) -> Signal' System50 Bool
expectedOutput = outputVerifier' system50 $(v [0 :: (BitVector 12), 0, 0, 0, 0, 0, 0, 2, 2, -2, -2, 2047, 2047, -2047, -2047, -2048, -2048, 0, 0])

runTest = sampleN 19 $ expectedOutput $ topEntity $ unbundle' system50 testInput
