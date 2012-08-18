{-# LANGUAGE QuasiQuotes #-}

module Problems.Problem2 where

import Data.Text (Text)

import Rosalind (Dna(..), parseDna, complement, parseOnly, st)

problem :: Text -> Text
problem t = case parseOnly parseDna t of
    Left err -> error $ "Invalid input. " ++ err
    Right (Dna bases) -> let complemented = map complement $ reverse bases in
        [st|#{complemented}|]
