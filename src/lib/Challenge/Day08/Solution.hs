module Challenge.Day08.Solution (solveA, solveB) where

import Data.List (minimumBy, transpose)
import Data.List.Split (chunksOf)
import Data.Ord (comparing)
import Data.Bool (bool)

countElem :: Eq a => a -> [a] -> Int
countElem = (length .) . filter . (==)

solveA :: [Int] -> Int
solveA = ((*) <$> countElem 1 <*> countElem 2) . minimumBy (comparing (countElem 0)) . chunksOf (25 * 6)

solveB :: [Int] -> String
solveB = unlines . chunksOf 25 . map (bool ' ' '█' . (== 1) . head . dropWhile (== 2)) . transpose . chunksOf (25 * 6)
