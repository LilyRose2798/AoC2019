module Challenge.Day12.Solution (solveA, solveB) where

import Linear.V3 (V3(..), _x, _y, _z)
import qualified Data.Set as Set
import Control.Lens (Lens')
import Control.Lens.Getter (Getting, (^.))
import Data.Function (on)

energy :: Num a => (V3 a, V3 a) -> a
energy (p, v) = sum (abs p) * sum (abs v)

simulate :: Num a => [(a, a)] -> [(a, a)]
simulate as = do
    let ps = map fst as
        vs = map snd as 
    map (\(p, v) -> (\v' -> (p + v', v')) $ (+ v) $ sum $ map (\p' -> signum (p' - p)) ps) as

solveA :: [V3 Int] -> Int
solveA = sum . map energy . head . drop 1000 . iterate simulate . flip zip (repeat (V3 0 0 0))

takeWhileUnique xs = takeWhileUnique' xs Set.empty
    where takeWhileUnique' (x:xs) s | Set.notMember x s = x : takeWhileUnique' xs (Set.insert x s)
          takeWhileUnique' _ _ = []

loopLength :: (Num a, Ord a) => Getting a (V3 a) a -> [(V3 a, V3 a)] -> Int
loopLength = ((length . takeWhileUnique . iterate simulate) .) . map .  uncurry . ((,) `on`) . flip (^.)

solveB :: [V3 Int] -> Int
solveB = (lcm <$> (lcm <$> loopLength _x <*> loopLength _y) <*> loopLength _z) . flip zip (repeat (V3 0 0 0))
