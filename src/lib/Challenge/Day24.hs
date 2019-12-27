module Challenge.Day24 (day24a, day24b) where

import Challenge.Day24.Solution
import Data.List.Split (splitOn)
import qualified Data.Set as Set
import Linear.V2 (V2(..))
import Linear.V3 (V3(..))

parseInput :: (Num m, Enum m, Num n, Enum n, Ord a) => (m -> n -> a) -> IO (Set.Set a)
parseInput f = Set.fromList . concatMap (uncurry (map . flip f)) . zip [0..] . map (map fst . filter ((== '#') . snd) . zip [0..]) . lines <$> readFile "src/lib/Challenge/Day24/input.txt"

parseInputA :: IO Grid2
parseInputA = parseInput V2

parseInputB :: IO Grid3
parseInputB = parseInput (flip flip 0 . V3)

day24a :: IO ()
day24a = parseInputA >>= putStrLn . show . solveA

day24b :: IO ()
day24b = parseInputB >>= putStrLn . show . solveB
