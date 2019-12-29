module Challenge.Day10.Solution (solveA, solveB) where

import Data.Ord (comparing)
import Linear.V2 (V2(..))
import Data.List

simplify :: V2 Int -> V2 Int
simplify (V2 x y) = do
    let g = gcd x y
    case g of
        0 -> V2 0 0
        _ -> V2 (x `div` g) (y `div` g)

visible :: [V2 Int] -> V2 Int -> [V2 Int]
visible xs x = nub $ map (simplify . subtract x) $ delete x xs

countVisible :: [V2 Int] -> V2 Int -> Int
countVisible xs = length . visible xs

bestStation :: [V2 Int] -> V2 Int
bestStation xs = maximumBy (comparing (countVisible xs)) xs

angle :: V2 Int -> Double
angle (V2 x y) = (\a -> if a < 0 then 2 * pi + a else a) $ atan2 (fromIntegral x) (fromIntegral (-y))

sweep :: [V2 Int] -> V2 Int -> [V2 Int]
sweep xs x = ((++) <$> sortBy (comparing angle) <*> flip sweep x . (xs \\)) (visible xs x)

solveA :: [V2 Int] -> Int
solveA xs = maximum $ map (countVisible xs) xs

solveB :: [V2 Int] -> Int
solveB xs = do
    let station = bestStation xs
    (\(V2 x y) -> 100 * x + y) $ (+ station) $ head $ drop 199 $ sweep xs station
