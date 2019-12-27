module Challenge.Day16.Solution (solveA, solveB) where

import Data.Digits (unDigits)

basePattern :: [Int]
basePattern = cycle [0, 1, 0, -1]

pattern :: Int -> [Int]
pattern n = drop 1 $ concat $ map (replicate n) basePattern

patterns :: [[Int]]
patterns = map pattern [1..]

phase :: [Int] -> [Int]
phase xs = zipWith ((((`mod` 10) . abs . sum) .) . zipWith (*)) patterns (replicate (length xs) xs)

solveA :: [Int] -> Int
solveA = unDigits 10 . take 8 . head . drop 100 . iterate phase

solveB :: [Int] -> Int
solveB = unDigits 10 . take 8 . (drop . unDigits 10 . take 7 <*> head . drop 100 . iterate phase . concat . replicate 10000)
