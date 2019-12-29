module Challenge.Day14.Solution
    ( solveA
    , solveB
    , Chemical
    , Quantity
    , ChemicalQuantity
    , Reaction
    ) where

import qualified Data.Map as Map
import Control.Arrow

type Chemical = String
type Quantity = Int
type ChemicalQuantity = (Chemical, Quantity)
type Reaction = ([ChemicalQuantity], ChemicalQuantity)
type ProductMap = Map.Map Chemical (Quantity, [ChemicalQuantity])

roundUpDiv :: Integral a => a -> a -> a
roundUpDiv x y = (x + y - 1) `div` y

reagents :: ProductMap -> ChemicalQuantity -> [ChemicalQuantity]
reagents pm cq@(c, q) = case Map.lookup c pm of
    Just (q', cqs) -> map (second (q `roundUpDiv` q' *)) cqs
    Nothing -> [cq]

combineCQs :: [ChemicalQuantity] -> [ChemicalQuantity]
combineCQs = Map.toList . Map.fromListWith (+)

allReagents :: ProductMap -> [ChemicalQuantity] -> [ChemicalQuantity]
allReagents pm cqs = combineCQs $ concat $ map (reagents pm) cqs

solveA :: [Reaction] -> Int
solveA xs = snd $ head $ head $ drop 12 $ iterate (allReagents (Map.fromList $ map (\(r, (c, q)) -> (c, (q, r))) xs)) [("FUEL", 1)]

solveB :: [Reaction] -> Int
solveB _ = 0
