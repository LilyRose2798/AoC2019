module Challenge.Day19 (day19a, day19b) where

import Challenge.Day19.Solution
import Data.List.Split (splitOn)

parseInput :: IO [Int]
parseInput = map read . splitOn "," <$> readFile "src/lib/Challenge/Day19/input.txt"

day19a :: IO ()
day19a = parseInput >>= putStrLn . show . solveA

day19b :: IO ()
day19b = parseInput >>= putStrLn . show . solveB
