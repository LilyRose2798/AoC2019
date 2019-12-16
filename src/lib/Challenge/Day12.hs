{-# LANGUAGE OverloadedStrings #-}
module Challenge.Day12 (day12a, day12b) where

import Challenge.Day12.Solution
import Data.Attoparsec.Text
import Prelude hiding (readFile)
import Data.Text.IO (readFile)
import Data.Either
import Linear.V3

coord :: Parser Int
coord = letter *> "=" *> signed decimal

v3Coord :: Parser (V3 Int)
v3Coord = "<" *> ((\(x:y:z:_) -> V3 x y z) <$> count 3 (coord <* option "" ", ")) <* ">"

v3List :: Parser [V3 Int]
v3List = v3Coord `sepBy` endOfLine

parseInput :: IO [V3 Int]
parseInput = fromRight [] . parseOnly v3List <$> readFile "src/lib/Challenge/Day12/input.txt"

day12a :: IO ()
day12a = parseInput >>= putStrLn . show . solveA

day12b :: IO ()
day12b = parseInput >>= putStrLn . show . solveB
