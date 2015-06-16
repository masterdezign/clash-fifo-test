module Test.Ad1
  where

import CLaSH.Prelude
import CLaSH.Prelude.Explicit

import Clocks
import Ad1

-- let a = simulateB da4 $ L.replicate 101 (0,1)
-- putStrLn $ show $ (L.take 101 a :: [(Bit, Bit)])

testInput :: Signal' AD20 (BitVector 2)
testInput = stimuliGenerator' ad20 $(v [
                              -- packet 0
                              0::(BitVector 2), 0, 0, 0  -- Void pack
                              , 1, 1, 1, 1
                              , 1, 1, 1, 1
                              , 1, 1, 1, 1
                              , 0, 0, 0, 0  -- Void pack
                              -- packet 1
                              , 0, 0, 0, 0  -- Void pack
                              , 2, 2, 2, 2
                              , 2, 2, 2, 2
                              , 2, 2, 2, 2
                              , 0, 0, 0, 0  -- Void pack
                              -- packet 2
                              , 0, 0, 0, 0  -- Void pack
                              , 3, 2, 1, 3
                              , 3, 3, 3, 3
                              , 3, 3, 3, 3
                              , 0, 0, 0, 0  -- Void pack
                              ] )

runTest = sampleN 60 $ expectedOutput $ bundle' ad20 $ ad1 testInput

expectedOutput :: Signal' AD20 (OutWord, OutWord, Bit) -> Signal' AD20 Bool
expectedOutput = outputVerifier' ad20 $(v [ (0::OutWord, 0::OutWord, 0::Bit)  -- Void pack
                                      , (0, 0, 0)  -- Void pack
                                      , (0, 0, 0)  -- Void pack
                                      , (0, 0, 0)  -- Void pack
                                      , (0, 0, 0)
                                      , (0, 0, 0)
                                      , (0, 0, 0)
                                      , (0, 0, 0)
                                      , (0, 0, 0)
                                      , (0, 0, 0)
                                      , (0, 0, 0)
                                      , (0, 0, 0)
                                      , (0, 0, 0)
                                      , (0, 0, 0)
                                      , (0, 0, 0)
                                      , (0, 0, 0)
                                      , (0, 2^12 - 1, 1)  -- Void pack
                                      , (0, 2^12 - 1, 1)  -- Void pack
                                      , (0, 2^12 - 1, 1)  -- Void pack
                                      , (0, 2^12 - 1, 1)  -- Void pack
                                      -- packet 1
                                      , (0, 2^12 - 1, 0)  -- Void pack
                                      , (0, 2^12 - 1, 0)  -- Void pack
                                      , (0, 2^12 - 1, 0)  -- Void pack
                                      , (0, 2^12 - 1, 0)  -- Void pack
                                      , (0, 2^12 - 1, 0)
                                      , (0, 2^12 - 1, 0)
                                      , (0, 2^12 - 1, 0)
                                      , (0, 2^12 - 1, 0)
                                      , (0, 2^12 - 1, 0)
                                      , (0, 2^12 - 1, 0)
                                      , (0, 2^12 - 1, 0)
                                      , (0, 2^12 - 1, 0)
                                      , (0, 2^12 - 1, 0)
                                      , (0, 2^12 - 1, 0)
                                      , (0, 2^12 - 1, 0)
                                      , (0, 2^12 - 1, 0)
                                      , (2^12 - 1, 0, 1)  -- Void pack
                                      , (2^12 - 1, 0, 1)  -- Void pack
                                      , (2^12 - 1, 0, 1)  -- Void pack
                                      , (2^12 - 1, 0, 1)  -- Void pack
                                      -- packet 2
                                      , (2^12 - 1, 0, 0)  -- Void pack
                                      , (2^12 - 1, 0, 0)  -- Void pack
                                      , (2^12 - 1, 0, 0)  -- Void pack
                                      , (2^12 - 1, 0, 0)  -- Void pack
                                      , (2^12 - 1, 0, 0)
                                      , (2^12 - 1, 0, 0)
                                      , (2^12 - 1, 0, 0)
                                      , (2^12 - 1, 0, 0)
                                      , (2^12 - 1, 0, 0)
                                      , (2^12 - 1, 0, 0)
                                      , (2^12 - 1, 0, 0)
                                      , (2^12 - 1, 0, 0)
                                      , (2^12 - 1, 0, 0)
                                      , (2^12 - 1, 0, 0)
                                      , (2^12 - 1, 0, 0)
                                      , (2^12 - 1, 0, 0)
                                      , (2^12 - 1 - 2^9, 2^12 - 1 - 2^10, 1)  -- Void pack
                                      , (2^12 - 1 - 2^9, 2^12 - 1 - 2^10, 1)  -- Void pack
                                      , (2^12 - 1 - 2^9, 2^12 - 1 - 2^10, 1)  -- Void pack
                                      , (2^12 - 1 - 2^9, 2^12 - 1 - 2^10, 1)  -- Void pack
                                 ])
