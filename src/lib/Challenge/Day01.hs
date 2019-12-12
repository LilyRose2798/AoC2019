module Challenge.Day01 (day01a, day01b) where

import Challenge.Day01.Solution

parseInput :: IO [Int]
parseInput = (map read . lines) <$> readFile "src/lib/Challenge/Day01/input.txt"

day01a :: IO ()
day01a = parseInput >>= (putStrLn . show . solveA)

day01b :: IO ()
day01b = parseInput >>= (putStrLn . show . solveB)
