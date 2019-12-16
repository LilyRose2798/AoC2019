module Challenge.Day06 (day06a, day06b) where

import Challenge.Day06.Solution

parseInput :: IO [(String, String)]
parseInput = drop 1 . map ((,) <$> take 3 <*> drop 4) . lines <$> readFile "src/lib/Challenge/Day06/input.txt"

day06a :: IO ()
day06a = parseInput >>= putStrLn . show . solveA

day06b :: IO ()
day06b = parseInput >>= putStrLn . show . solveB
