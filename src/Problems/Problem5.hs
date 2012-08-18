{-# LANGUAGE QuasiQuotes #-}

module Problems.Problem5 where

import Data.Text (Text)

import Rosalind (Dna(..), parseDna, dnaBase2RnaBase, parseOnly, st)

problem :: Text -> Text
problem t = case parseOnly parseDna t of
    Left err -> error $ "Invalid input. " ++ err
    Right (Dna dnaBases) ->
        let rnaBases = map dnaBase2RnaBase dnaBases in [st|#{rnaBases}|]