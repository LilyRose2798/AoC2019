module Challenge.Day13 (day13a, day13b) where

import Challenge.Day13.Solution
import Data.List.Split (splitOn)

parseInput :: IO [Int]
parseInput = map read . splitOn "," <$> readFile "src/lib/Challenge/Day13/input.txt"

day13a :: IO ()
day13a = parseInput >>= putStrLn . show . solveA

day13b :: IO ()
day13b = parseInput >>= putStrLn . show . solveB
