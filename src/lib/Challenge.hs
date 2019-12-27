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
import Challenge.Day13
import Challenge.Day14
import Challenge.Day15
import Challenge.Day16
import Challenge.Day17
import Challenge.Day18
import Challenge.Day19
import Challenge.Day20
import Challenge.Day21
import Challenge.Day22
import Challenge.Day23
import Challenge.Day24
import Challenge.Day25

challengeMap :: [(String, IO ())]
challengeMap = 
    [ ( "1a", day01a), ( "1b", day01b), ( "1", day01a >> day01b)
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
    , ("13a", day13a), ("13b", day13b), ("13", day13a >> day13b)
    , ("14a", day14a), ("14b", day14b), ("14", day14a >> day14b)
    , ("15a", day15a), ("15b", day15b), ("15", day15a >> day15b)
    , ("16a", day16a), ("16b", day16b), ("16", day16a >> day16b)
    , ("17a", day17a), ("17b", day17b), ("17", day17a >> day17b)
    , ("18a", day18a), ("18b", day18b), ("18", day18a >> day18b)
    , ("19a", day19a), ("19b", day19b), ("19", day19a >> day19b)
    , ("20a", day20a), ("20b", day20b), ("20", day20a >> day20b)
    , ("21a", day21a), ("21b", day21b), ("21", day21a >> day21b)
    , ("22a", day22a), ("22b", day22b), ("22", day22a >> day22b)
    , ("23a", day23a), ("23b", day23b), ("23", day23a >> day23b)
    , ("24a", day24a), ("24b", day24b), ("24", day24a >> day24b)
    , ("25a", day25a), ("25b", day25b), ("25", day25a >> day25b)
    ]
