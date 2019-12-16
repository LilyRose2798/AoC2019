module Challenge.Day07 (day07a, day07b) where

import Challenge.Day07.Solution
import Data.List.Split (splitOn)

parseInput :: IO [Int]
parseInput = map read . splitOn "," <$> readFile "src/lib/Challenge/Day07/input.txt"

day07a :: IO ()
day07a = parseInput >>= putStrLn . show . solveA

day07b :: IO ()
day07b = parseInput >>= putStrLn . show . solveB
