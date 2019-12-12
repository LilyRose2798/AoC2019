module Challenge.Day03 (day03a, day03b) where

import Challenge.Day03.Solution
import Data.List.Split (splitOn)

parseInput :: IO [Int]
parseInput = map read . splitOn "," <$> readFile "src/lib/Challenge/Day03/input.txt"

day03a :: IO ()
day03a = parseInput >>= (putStrLn . show . solveA)

day03b :: IO ()
day03b = parseInput >>= (putStrLn . show . solveB)
