module Challenge.Day02 (day02a, day02b) where

import Challenge.Day02.Solution
import Data.List.Split (splitOn)

parseInput :: IO [Int]
parseInput = map read . splitOn "," <$> readFile "src/lib/Challenge/Day02/input.txt"

day02a :: IO ()
day02a = parseInput >>= (putStrLn . show . solveA)

day02b :: IO ()
day02b = parseInput >>= (putStrLn . show . solveB)
