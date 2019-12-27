module Challenge.Day23 (day23a, day23b) where

import Challenge.Day23.Solution
import Data.List.Split (splitOn)

parseInput :: IO [Int]
parseInput = map read . splitOn "," <$> readFile "src/lib/Challenge/Day23/input.txt"

day23a :: IO ()
day23a = parseInput >>= putStrLn . show . solveA

day23b :: IO ()
day23b = parseInput >>= putStrLn . show . solveB
