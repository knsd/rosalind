module Main where

import Prelude hiding (getContents)

import Rosalind (Dna(..), parseDnaPair, parseOnly)

import Data.Text.IO (getContents)

main :: IO ()
main = getContents >>= \t -> case parseOnly parseDnaPair t of
        Left err -> error $ "Invalid input. " ++ err
        Right (Dna first, Dna second) ->
            print $ length $ filter (\(a, b) -> a /= b) $ zip first second
