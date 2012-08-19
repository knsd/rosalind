{-# LANGUAGE QuasiQuotes #-}

module Problems.Problem5 where

import Data.Text (Text)

import Rosalind (parseDnaBases, dnaBase2RnaBase, parseOnly, st)

problem :: Text -> Text
problem t = case parseOnly parseDnaBases t of
    Left err -> error $ "Invalid input. " ++ err
    Right dnaBases -> let rnaBases = map dnaBase2RnaBase dnaBases in
        [st|#{rnaBases}|]