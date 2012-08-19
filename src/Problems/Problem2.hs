module Problems.Problem2 where

import Data.Text (Text)

import Rosalind (parseDnaBases, complement, parseOnly, toText)

problem :: Text -> Text
problem t = case parseOnly parseDnaBases t of
    Left err -> error $ "Invalid input. " ++ err
    Right bases -> toText $ map complement $ reverse bases
