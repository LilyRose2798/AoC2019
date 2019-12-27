module Challenge.Day18 (day18a, day18b) where

import Challenge.Day18.Solution
import Data.List.Split (splitOn)

parseInput :: IO [Int]
parseInput = map read . splitOn "," <$> readFile "src/lib/Challenge/Day18/input.txt"

day18a :: IO ()
day18a = parseInput >>= putStrLn . show . solveA

day18b :: IO ()
day18b = parseInput >>= putStrLn . show . solveB
