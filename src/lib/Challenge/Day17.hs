module Challenge.Day17 (day17a, day17b) where

import Challenge.Day17.Solution
import Data.List.Split (splitOn)

parseInput :: IO [Int]
parseInput = map read . splitOn "," <$> readFile "src/lib/Challenge/Day17/input.txt"

day17a :: IO ()
day17a = parseInput >>= putStrLn . show . solveA

day17b :: IO ()
day17b = parseInput >>= putStrLn . show . solveB
