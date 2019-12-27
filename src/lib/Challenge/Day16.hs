module Challenge.Day16 (day16a, day16b) where

import Challenge.Day16.Solution
import Data.Char (digitToInt)

parseInput :: IO [Int]
parseInput = map digitToInt . head . lines <$> readFile "src/lib/Challenge/Day16/input.txt"

day16a :: IO ()
day16a = parseInput >>= putStrLn . show . solveA

day16b :: IO ()
day16b = parseInput >>= putStrLn . show . solveB
