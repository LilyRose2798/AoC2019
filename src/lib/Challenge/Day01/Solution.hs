module Challenge.Day01.Solution (solveA, solveB) where

fuelMass :: Int -> Int
fuelMass = subtract 2 . (`div` 3)

solveA :: [Int] -> Int
solveA = sum . map fuelMass

solveB :: [Int] -> Int
solveB = sum . map (sum . takeWhile (> 0) . drop 1 . iterate fuelMass)
-- solveB = sum . map (fuelMassRec . fuelMass)
--     where fuelMassRec m | m > 0 = m + fuelMassRec (fuelMass m)
--                         | otherwise = 0
