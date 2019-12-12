module Challenge.Day08 (day08a, day08b) where

import Challenge.Day08.Solution
import Data.Char (digitToInt)

parseInput :: IO [Int]
parseInput = (map digitToInt . head . lines) <$> readFile "src/lib/Challenge/Day08/input.txt"

day08a :: IO ()
day08a = parseInput >>= (putStrLn . show . solveA)

day08b :: IO ()
day08b = parseInput >>= (putStr . solveB)
