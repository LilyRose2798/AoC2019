module Challenge.Day04 (day04a, day04b) where

import Challenge.Day04.Solution

parseInput :: IO [Integer]
parseInput = return [256310..732736]

day04a :: IO ()
day04a = parseInput >>= putStrLn . show . solveA

day04b :: IO ()
day04b = parseInput >>= putStrLn . show . solveB
