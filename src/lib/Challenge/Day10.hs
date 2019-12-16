module Challenge.Day10 (day10a, day10b) where

import Challenge.Day10.Solution
import Linear.V2 (V2(..))

parseInput :: IO [V2 Int]
parseInput = concatMap (uncurry (map . flip V2)) . zip [0..] . map (map fst . filter ((== '#') . snd) . zip [0..]) . lines <$> readFile "src/lib/Challenge/Day10/input.txt"

day10a :: IO ()
day10a = parseInput >>= putStrLn . show . solveA

day10b :: IO ()
day10b = parseInput >>= putStrLn . show . solveB
