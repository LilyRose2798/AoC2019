module Challenge.Day22 (day22a, day22b) where

import Challenge.Day22.Solution
import Data.List.Split (splitOn)

parseInput :: IO [Int]
parseInput = map read . splitOn "," <$> readFile "src/lib/Challenge/Day22/input.txt"

day22a :: IO ()
day22a = parseInput >>= putStrLn . show . solveA

day22b :: IO ()
day22b = parseInput >>= putStrLn . show . solveB
