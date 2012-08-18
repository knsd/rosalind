{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}

module Problems.Problem4 where

import Data.List (isPrefixOf, tails)

import Data.Text (Text, intercalate)

import Rosalind (Dna(..), parseDnaPair, parseOnly, st)

problem :: Text -> Text
problem t = case parseOnly parseDnaPair t of
    Left err -> error $ "Invalid input. " ++ err
    Right (Dna dna, Dna subdna) ->
        let indexes =  map snd $ filter (isPrefixOf subdna . fst) $
                zip (tails dna) ints in
                    intercalate " " $ map (\index -> [st|#{index}|]) indexes
  where
    ints :: [Int]
    ints = [1 ..]
