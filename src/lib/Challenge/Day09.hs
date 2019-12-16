module Challenge.Day09 (day09a, day09b) where

import Challenge.Day09.Solution
import Data.List.Split (splitOn)

parseInput :: IO [Int]
parseInput = map read . splitOn "," <$> readFile "src/lib/Challenge/Day09/input.txt"

day09a :: IO ()
day09a = parseInput >>= putStrLn . show . solveA

day09b :: IO ()
day09b = parseInput >>= putStrLn . show . solveB
