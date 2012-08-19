module Problems.Problem5 where

import Data.Text (Text)

import Rosalind (parseDnaBases, dnaBase2RnaBase, parseOnly, toText)

problem :: Text -> Text
problem t = case parseOnly parseDnaBases t of
    Left err -> error $ "Invalid input. " ++ err
    Right dnaBases -> toText $ map dnaBase2RnaBase dnaBases