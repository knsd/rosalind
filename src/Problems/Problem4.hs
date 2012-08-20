{-# LANGUAGE OverloadedStrings #-}

module Problems.Problem4 where

import Data.List (isPrefixOf, tails)

import Data.Text.Lazy (Text, intercalate)

import Rosalind (parseDnaBasesPair, parse, toText)

problem :: Text -> Text
problem t = case parse parseDnaBasesPair t of
    Left err -> error $ "Invalid input. " ++ err
    Right (dna, subdna) ->
        let indexes =  map snd $ filter (isPrefixOf subdna . fst) $
                zip (tails dna) ints in
                    intercalate " " $ map toText indexes
  where
    ints :: [Int]
    ints = [1 ..]
