module Problems.Problem3 where

import Data.Text.Lazy (Text)

import Rosalind (parseDnaBasesPair, parse, toText)

problem :: Text -> Text
problem t = case parse parseDnaBasesPair t of
    Left err -> error $ "Invalid input. " ++ err
    Right (first, second) -> toText $
        length $ filter (\(a, b) -> a /= b) $ zip first second 
