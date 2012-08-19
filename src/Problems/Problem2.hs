{-# LANGUAGE QuasiQuotes #-}

module Problems.Problem2 where

import Data.Text (Text)

import Rosalind (parseDnaBases, complement, parseOnly, st)

problem :: Text -> Text
problem t = case parseOnly parseDnaBases t of
    Left err -> error $ "Invalid input. " ++ err
    Right bases -> let complemented = map complement $ reverse bases in
        [st|#{complemented}|]
