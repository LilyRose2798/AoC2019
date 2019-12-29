module Challenge.Day12 (day12a, day12b) where

import Challenge.Day12.Solution
import Data.Attoparsec.Text
import Prelude hiding (readFile)
import Data.Text.IO (readFile)
import Data.Either (fromRight)
import Data.Maybe (catMaybes)
import Linear.V3 (V3(..))

coord :: Parser Int
coord = letter *> "=" *> signed decimal

coordListToV3 :: [Int] -> Maybe (V3 Int)
coordListToV3 (x:y:z:_) = Just (V3 x y z)
coordListToV3 _ = Nothing

v3Coord :: Parser (Maybe (V3 Int))
v3Coord = "<" *> (coordListToV3 <$> coord `sepBy` ", ") <* ">"

v3List :: Parser [V3 Int]
v3List = catMaybes <$> v3Coord `sepBy` endOfLine

parseInput :: IO [V3 Int]
parseInput = fromRight [] . parseOnly v3List <$> readFile "src/lib/Challenge/Day12/input.txt"

day12a :: IO ()
day12a = parseInput >>= putStrLn . show . solveA

day12b :: IO ()
day12b = parseInput >>= putStrLn . show . solveB
