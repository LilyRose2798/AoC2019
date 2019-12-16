module Challenge.Day11 (day11a, day11b) where

import Challenge.Day11.Solution
import Data.List.Split (splitOn)

parseInput :: IO [Int]
parseInput = map read . splitOn "," <$> readFile "src/lib/Challenge/Day11/input.txt"

day11a :: IO ()
day11a = parseInput >>= putStrLn . show . solveA

day11b :: IO ()
day11b = parseInput >>= putStrLn . show . solveB
