module Challenge.Day04.Solution (solveA, solveB) where

import Data.Digits (digits)
import Data.List (group)

solveA :: [Integer] -> Int
solveA = length . filter ((&&) <$> and . ((zipWith (<=)) <*> tail) <*> any (>= 2) . map length . group) . map (digits 10)

solveB :: [Integer] -> Int
solveB = length . filter ((&&) <$> and . ((zipWith (<=)) <*> tail) <*> any (== 2) . map length . group) . map (digits 10)
