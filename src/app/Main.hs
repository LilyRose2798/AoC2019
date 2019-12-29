module Main where

import Data.List (lookup)
import System.Environment (getArgs)
import System.Exit (exitFailure)
import Challenge

main :: IO ()
main = do
    args <- getArgs
    case args of
        (cmd:_) ->
            case lookup cmd challengeMap of
                (Just x) -> x
                _ -> exitGracefully
        _ -> exitGracefully

exitGracefully :: IO ()
exitGracefully = do
    putStrLn "Usage: aoc2019 <day>[part]"
    exitFailure
