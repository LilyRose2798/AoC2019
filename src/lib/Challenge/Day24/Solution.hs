module Challenge.Day24.Solution (solveA, solveB, Grid2, Grid3) where

import qualified Data.Set as Set
import Linear.V2 (V2(..))
import Linear.V3 (V3(..))
import Data.Bool (bool)
import Data.List (intercalate)

type Grid2 = Set.Set (V2 Int)

neighbours :: V2 Int -> Grid2
neighbours = Set.fromList . filter (\p -> minimum p >= 0 && maximum p < 5) . flip map [V2 (-1) 0, V2 1 0, V2 0 (-1), V2 0 1] . (+)

livingNeighbourCount :: Grid2 -> V2 Int -> Int
livingNeighbourCount g = Set.size . Set.filter (`Set.member` g) . neighbours

staysAlive :: Grid2 -> V2 Int -> Bool
staysAlive g p | p `Set.member` g = livingNeighbourCount g p `elem` [1]
               | otherwise = livingNeighbourCount g p `elem` [1,2]

extendGrid :: Grid2 -> Grid2
extendGrid = Set.union <*> Set.unions . map neighbours . Set.toList

nextGen :: Grid2 -> Grid2
nextGen = Set.filter <$> staysAlive <*> extendGrid

biodiversityRating :: Grid2 -> Int
biodiversityRating = sum . map (\(V2 x y) -> 2 ^ (y * 5 + x)) . Set.toList

dropWhileUnique :: Ord a => [a] -> [a]
dropWhileUnique xs = dropWhileUnique' xs Set.empty
    where dropWhileUnique' (x:xs) s | Set.notMember x s = dropWhileUnique' xs (Set.insert x s)
          dropWhileUnique' xs _ = xs

showGrid :: Grid2 -> String
showGrid g = unlines $ map (\y -> map (\x -> bool '.' '#' (V2 x y `Set.member` g)) [0..4]) [0..4]

solveA :: Grid2 -> Int
solveA = biodiversityRating . head . dropWhileUnique . iterate nextGen


type Grid3 = Set.Set (V3 Int)

resolveOOB :: V3 Int -> [V3 Int]
resolveOOB p = [p]

-- leftNeighbours :: V3 Int -> [V3 Int]
-- leftNeighbours (V3 3 2 z) = map (\y -> V3 4 y (z + 1)) [0..4]
-- leftNeighbours (V3 0 _ z) = [V3 1 2 (z - 1)]
-- leftNeighbours p = [p + V3 (-1) 0 0]

-- rightNeighbours :: V3 Int -> [V3 Int]
-- rightNeighbours (V3 1 2 z) = map (\y -> V3 0 y (z + 1)) [0..4]
-- rightNeighbours (V3 4 _ z) = [V3 3 2 (z - 1)]
-- rightNeighbours p = [p + V3 1 0 0]

-- topNeighbours :: V3 Int -> [V3 Int]
-- topNeighbours (V3 2 3 z) = map (\x -> V3 x 4 (z + 1)) [0..4]
-- topNeighbours (V3 _ 0 z) = [V3 2 1 (z - 1)]
-- topNeighbours p = [p + V3 0 (-1) 0]

-- bottomNeighbours :: V3 Int -> [V3 Int]
-- bottomNeighbours (V3 2 1 z) = map (\x -> V3 x 0 (z + 1)) [0..4]
-- bottomNeighbours (V3 _ 4 z) = [V3 2 3 (z - 1)]
-- bottomNeighbours p = [p + V3 0 1 0]

neighboursGeneric :: (Int -> Int -> Bool) -> (Int -> Int -> Bool) -> (Int -> Int -> V3 Int) -> (Int -> V3 Int) -> V3 Int -> V3 Int -> [V3 Int]
neighboursGeneric f g h i j p@(V3 x y z) | f x y = map (\a -> h a (z + 1)) [0..4]
                                         | g x y = [i (z - 1)]
                                         | otherwise = [p + j]

leftNeighbours = neighboursGeneric (\x y -> x == 3 && y == 2) (\x _ -> x == 0) (\y z -> V3 4 y z) (\z -> V3 1 2 z) (V3 (-1) 0 0)
rightNeighbours = neighboursGeneric (\x y -> x == 1 && y == 2) (\x _ -> x == 4) (\y z -> V3 0 y z) (\z -> V3 3 2 z) (V3 1 0 0)
topNeighbours = neighboursGeneric (\x y -> x == 2 && y == 3) (\_ y -> y == 0) (\x z -> V3 x 4 z) (\z -> V3 2 1 z) (V3 0 (-1) 0)
bottomNeighbours = neighboursGeneric (\x y -> x == 2 && y == 1) (\_ y -> y == 4) (\x z -> V3 x 0 z) (\z -> V3 2 3 z) (V3 0 1 0)

neighbours' :: V3 Int -> Grid3
neighbours' p = Set.fromList $ leftNeighbours p ++ rightNeighbours p ++ topNeighbours p ++ bottomNeighbours p

livingNeighbourCount' :: Grid3 -> V3 Int -> Int
livingNeighbourCount' g = Set.size . Set.filter (`Set.member` g) . neighbours'

staysAlive' :: Grid3 -> V3 Int -> Bool
staysAlive' g p | p `Set.member` g = livingNeighbourCount' g p `elem` [1]
                | otherwise = livingNeighbourCount' g p `elem` [1,2]

extendGrid' :: Grid3 -> Grid3
extendGrid' = Set.union <*> Set.unions . map neighbours' . Set.toList

nextGen' :: Grid3 -> Grid3
nextGen' = Set.filter <$> staysAlive' <*> extendGrid'

showGrid' :: Grid3 -> String
showGrid' g = unlines $ map unlines $ map (\z -> map (\y -> map (\x -> bool (bool '.' '#' (V3 x y z `Set.member` g)) '?' (x == 2 && y == 2)) [0..4]) [0..4]) [-5..5]

solveB :: Grid3 -> Int
solveB = length . head . drop 200 . iterate nextGen'
