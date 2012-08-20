module Problems.Problem5 where

import Data.Text.Lazy (Text)

import Rosalind (parseDnaBases, dnaBase2RnaBase, parse, toText)

problem :: Text -> Text
problem t = case parse parseDnaBases t of
    Left err -> error $ "Invalid input. " ++ err
    Right dnaBases -> toText $ map dnaBase2RnaBase dnaBases