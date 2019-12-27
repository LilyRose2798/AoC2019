module Challenge.Day25 (day25a, day25b) where

import Challenge.Day25.Solution
import Data.List.Split (splitOn)

parseInput :: IO [Int]
parseInput = map read . splitOn "," <$> readFile "src/lib/Challenge/Day25/input.txt"

day25a :: IO ()
day25a = parseInput >>= putStrLn . show . solveA

day25b :: IO ()
day25b = parseInput >>= putStrLn . show . solveB
