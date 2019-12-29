module Challenge.Day24.Solution
    (solveA
    , solveB
    , Coord
    , Point
    , Grid
    , Point2
    , Grid2
    , Point3
    , Grid3
    ) where

import qualified Data.Set as Set
import Linear.V2 (V2(..))
import Linear.V3 (V3(..))
import Data.Bool (bool)
import Data.List (intercalate)

type Coord = Int
type Point a = a Coord
type Grid a = Set.Set (Point a)

type Point2 = Point V2
type Grid2 = Grid V2

neighbours :: Point2 -> Grid2
neighbours = Set.fromList . filter (\p -> minimum p >= 0 && maximum p < 5) . flip map [V2 (-1) 0, V2 1 0, V2 0 (-1), V2 0 1] . (+)

livingNeighbourCount :: Grid2 -> Point2 -> Int
livingNeighbourCount g = Set.size . Set.filter (`Set.member` g) . neighbours

staysAlive :: Grid2 -> Point2 -> Bool
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

type Point3 = Point V3
type Grid3 = Grid V3

-- leftNeighbours :: Point3 -> [Point3]
-- leftNeighbours (V3 3 2 z) = map (\y -> V3 4 y (z + 1)) [0..4]
-- leftNeighbours (V3 0 _ z) = [V3 1 2 (z - 1)]
-- leftNeighbours p = [p + V3 (-1) 0 0]

-- rightNeighbours :: Point3 -> [Point3]
-- rightNeighbours (V3 1 2 z) = map (\y -> V3 0 y (z + 1)) [0..4]
-- rightNeighbours (V3 4 _ z) = [V3 3 2 (z - 1)]
-- rightNeighbours p = [p + V3 1 0 0]

-- topNeighbours :: Point3 -> [Point3]
-- topNeighbours (V3 2 3 z) = map (\x -> V3 x 4 (z + 1)) [0..4]
-- topNeighbours (V3 _ 0 z) = [V3 2 1 (z - 1)]
-- topNeighbours p = [p + V3 0 (-1) 0]

-- bottomNeighbours :: Point3 -> [Point3]
-- bottomNeighbours (V3 2 1 z) = map (\x -> V3 x 0 (z + 1)) [0..4]
-- bottomNeighbours (V3 _ 4 z) = [V3 2 3 (z - 1)]
-- bottomNeighbours p = [p + V3 0 1 0]

v2toV3 :: V2 a -> a -> V3 a
v2toV3 (V2 x y) z = V3 x y z

neighboursGeneric :: (Point2 -> Bool) -> (Point2 -> Bool) -> (Coord -> Point2) -> Point2 -> Point2 -> Point3 -> [Point3]
neighboursGeneric f g h i j p@(V3 x y z) | f (V2 x y) = map (\a -> v2toV3 (h a) (z + 1)) [0..4]
                                         | g (V2 x y) = [v2toV3 i (z - 1)]
                                         | otherwise = [p + v2toV3 j 0]

leftNeighbours = neighboursGeneric (\(V2 x y) -> x == 3 && y == 2) (\(V2 x _) -> x == 0) (\y -> V2 4 y) (V2 1 2) (V2 (-1) 0)
rightNeighbours = neighboursGeneric (\(V2 x y) -> x == 1 && y == 2) (\(V2 x _) -> x == 4) (\y -> V2 0 y) (V2 3 2) (V2 1 0)
topNeighbours = neighboursGeneric (\(V2 x y) -> x == 2 && y == 3) (\(V2 _ y) -> y == 0) (\x -> V2 x 4) (V2 2 1) (V2 0 (-1))
bottomNeighbours = neighboursGeneric (\(V2 x y) -> x == 2 && y == 1) (\(V2 _ y) -> y == 4) (\x -> V2 x 0) (V2 2 3) (V2 0 1)

neighbours' :: Point3 -> Grid3
neighbours' p = Set.fromList $ leftNeighbours p ++ rightNeighbours p ++ topNeighbours p ++ bottomNeighbours p

livingNeighbourCount' :: Grid3 -> Point3 -> Int
livingNeighbourCount' g = Set.size . Set.filter (`Set.member` g) . neighbours'

staysAlive' :: Grid3 -> Point3 -> Bool
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
