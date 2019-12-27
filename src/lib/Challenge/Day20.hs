module Challenge.Day20 (day20a, day20b) where

import Challenge.Day20.Solution
import Data.List.Split (splitOn)

parseInput :: IO [Int]
parseInput = map read . splitOn "," <$> readFile "src/lib/Challenge/Day20/input.txt"

day20a :: IO ()
day20a = parseInput >>= putStrLn . show . solveA

day20b :: IO ()
day20b = parseInput >>= putStrLn . show . solveB
