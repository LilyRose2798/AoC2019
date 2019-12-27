{-# LANGUAGE OverloadedStrings #-}
module Challenge.Day14 (day14a, day14b) where

import Challenge.Day14.Solution
import Control.Applicative
import Data.Attoparsec.Text
import Prelude hiding (readFile)
import Data.Text.IO (readFile)
import Data.Either

chemicalQuantity :: Parser (ChemicalQuantity)
chemicalQuantity = flip (,) <$> decimal <* space <*> many1 letter

reaction :: Parser (Reaction)
reaction = (,) <$> chemicalQuantity `sepBy` ", " <* " => " <*> chemicalQuantity

reactionList :: Parser [Reaction]
reactionList = reaction `sepBy` endOfLine

parseInput :: IO [Reaction]
parseInput = fromRight [] . parseOnly reactionList <$> readFile "src/lib/Challenge/Day14/input.txt"

day14a :: IO ()
day14a = parseInput >>= putStrLn . show . solveA

day14b :: IO ()
day14b = parseInput >>= putStrLn . show . solveB
