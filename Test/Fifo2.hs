module Test.Fifo2
  where

import qualified Data.List as L
import CLaSH.Prelude
import CLaSH.Prelude.Explicit

import Clocks
import Fifo2

topEntity :: (Signal' System50 Word12, Signal' System50 Bool) -> Signal' System50 Word12
topEntity x = (fifo d4) x

testInput :: Signal' System50 (Word12, Bool)
testInput = stimuliGenerator' system50 $(v [(2::Word12, True :: Bool)
                                            , (0, False)
                                            , (-2, True)
                                            , (0, False)
                                            , (2047, True)
                                            , (0, False)
                                            , (-2047, True)
                                            , (0, False)
                                            , (2048, True)
                                            , (0, False)
                                            , (0, True)
                                            , (0, False)
                                            , (0, True)
                                            , (0, False)
                                            , (0, True)
                                            , (0, False)
                                            , (0, True)
                                            , (0, False)
                                            , (0, True) ])

-- And extra input delay because of one clock cycle BRAM latency
expectedOutput :: Signal' System50 Word12 -> Signal' System50 Bool
expectedOutput = outputVerifier' system50 $(v [0 :: Word12, 0, 0, 0, 0, 0, 0, 0, 2, 2, -2, -2, 2047, 2047, -2047, -2047, -2048, -2048, 0, 0])

-- Drop the first, undefined value
runTest = L.drop 1 $ sampleN 20 $ expectedOutput $ topEntity $ unbundle' system50 testInput
