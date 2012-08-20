{-# LANGUAGE OverloadedStrings #-}

module Problems.Problem9 where

import Data.List (tails)

import Data.Text.Lazy (Text, intercalate)

import Rosalind (DnaBase, parseDnaBases, parse, complement, toText)

combinations :: [Int] -> [a] -> [([a], Int)]
combinations ns list = concat $ map go $ zip (tails list) [1..]
  where
    go ([], _) = []
    go (l, p) = concat $ flip map ns $ \n ->
        let (i, _) = splitAt n l in if length i == n
            then [(i, p)]
            else []

isReversePalindrom :: [DnaBase] -> Bool
isReversePalindrom b = b == (map complement $ reverse b)

problem :: Text -> Text
problem t = case parse parseDnaBases t of
    Left err -> error $ "Invalid input. " ++ err
    Right bases -> let xs = combinations [4..8] bases
                       palindroms = filter (isReversePalindrom . fst) xs in
        intercalate "\n" $ flip map palindroms $ \(l, pos) ->
            intercalate " " [toText pos, toText $ length l]
