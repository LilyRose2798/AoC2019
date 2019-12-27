module Challenge.Day21 (day21a, day21b) where

import Challenge.Day21.Solution
import Data.List.Split (splitOn)

parseInput :: IO [Int]
parseInput = map read . splitOn "," <$> readFile "src/lib/Challenge/Day21/input.txt"

day21a :: IO ()
day21a = parseInput >>= putStrLn . show . solveA

day21b :: IO ()
day21b = parseInput >>= putStrLn . show . solveB
