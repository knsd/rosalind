{-# LANGUAGE QuasiQuotes #-}

module Problems.Problem3 where

import Data.Text (Text)

import Rosalind (Dna(..), parseDnaPair, parseOnly, st)

problem :: Text -> Text
problem t = case parseOnly parseDnaPair t of
    Left err -> error $ "Invalid input. " ++ err
    Right (Dna first, Dna second) ->
        let distance = length $ filter (\(a, b) -> a /= b) $ zip first second in
            [st|#{distance}|]
