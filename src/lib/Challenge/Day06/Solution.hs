module Challenge.Day06.Solution (solveA, solveB) where

import Data.List (inits)
import Data.Tuple (swap)
import Data.Foldable (toList)
import qualified Data.Map.Strict as Map
import qualified Data.Set as Set

orbits :: Map.Map String String -> String -> [String]
orbits m o = case Map.lookup o m of
    Nothing -> []
    Just o' -> o' : orbits m o'

solveA :: [(String, String)] -> Int
solveA = sum . (map <$> (length .) . orbits . Map.fromList . map swap <*> Set.toList . Set.fromList . concatMap toList)
-- solveA xs = do
--     let orbitMap = Map.fromList $ map swap xs
--         objects = Set.toList $ Set.fromList $ concatMap toList xs
--     sum $ map (length . orbits orbitMap) objects

shortestPath :: Map.Map String String -> String -> String -> [String]
shortestPath m a b = head [x ++ init y | x <- tail $ inits $ orbits m a, y <- tail $ inits $ orbits m b, last x == last y]

solveB :: [(String, String)] -> Int
solveB xs = subtract 1 $ length $ shortestPath (Map.fromList $ map swap xs) "YOU" "SAN"
