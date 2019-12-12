module Challenge.Day05 (day05a, day05b) where

import Challenge.Day05.Solution
import Data.List.Split (splitOn)

parseInput :: IO [Int]
parseInput = map read . splitOn "," <$> readFile "src/lib/Challenge/Day05/input.txt"

day05a :: IO ()
day05a = parseInput >>= (putStrLn . show . solveA)

day05b :: IO ()
day05b = parseInput >>= (putStrLn . show . solveB)
