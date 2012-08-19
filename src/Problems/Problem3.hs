{-# LANGUAGE QuasiQuotes #-}

module Problems.Problem3 where

import Data.Text (Text)

import Rosalind (parseDnaBasesPair, parseOnly, st)

problem :: Text -> Text
problem t = case parseOnly parseDnaBasesPair t of
    Left err -> error $ "Invalid input. " ++ err
    Right (first, second) ->
        let distance = length $ filter (\(a, b) -> a /= b) $ zip first second in
            [st|#{distance}|]
