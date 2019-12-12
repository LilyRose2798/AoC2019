module Challenge (challengeMap) where

import Challenge.Day01
import Challenge.Day02
import Challenge.Day03
import Challenge.Day04
import Challenge.Day05
import Challenge.Day06
import Challenge.Day07
import Challenge.Day08
import Challenge.Day09
import Challenge.Day10
import Challenge.Day11
import Challenge.Day12

challengeMap :: [(String, IO ())]
challengeMap = [
      ( "1a", day01a), ( "1b", day01b), ( "1", day01a >> day01b)
    , ( "2a", day02a), ( "2b", day02b), ( "2", day02a >> day02b)
    , ( "3a", day03a), ( "3b", day03b), ( "3", day03a >> day03b)
    , ( "4a", day04a), ( "4b", day04b), ( "4", day04a >> day04b)
    , ( "5a", day05a), ( "5b", day05b), ( "5", day05a >> day05b)
    , ( "6a", day06a), ( "6b", day06b), ( "6", day06a >> day06b)
    , ( "7a", day07a), ( "7b", day07b), ( "7", day07a >> day07b)
    , ( "8a", day08a), ( "8b", day08b), ( "8", day08a >> day08b)
    , ( "9a", day09a), ( "9b", day09b), ( "9", day09a >> day09b)
    , ("10a", day10a), ("10b", day10b), ("10", day10a >> day10b)
    , ("11a", day11a), ("11b", day11b), ("11", day11a >> day11b)
    , ("12a", day12a), ("12b", day12b), ("12", day12a >> day12b)
    ]
