module Problems.Problem2 where

import Data.Text.Lazy (Text)

import Rosalind (parseDnaBases, complement, parse, toText)

problem :: Text -> Text
problem t = case parse parseDnaBases t of
    Left err -> error $ "Invalid input. " ++ err
    Right bases -> toText $ map complement $ reverse bases
