module Challenge.Day15 (day15a, day15b) where

import Challenge.Day15.Solution
import Data.List.Split (splitOn)

parseInput :: IO [Int]
parseInput = map read . splitOn "," <$> readFile "src/lib/Challenge/Day15/input.txt"

day15a :: IO ()
day15a = parseInput >>= putStrLn . show . solveA

day15b :: IO ()
day15b = parseInput >>= putStrLn . show . solveB
