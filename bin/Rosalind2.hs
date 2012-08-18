{-# LANGUAGE QuasiQuotes #-}

module Main where

import Prelude hiding (putStrLn, getContents)

import Data.Text.IO (getContents, putStrLn)

import Rosalind (Dna(..), parseDna, complement, parseOnly, st)

main :: IO ()
main = getContents >>= \t -> case parseOnly parseDna t of
        Left err -> error $ "Invalid input. " ++ err
        Right (Dna bases) ->
            let complemented = map complement $ reverse bases in
                putStrLn [st|#{complemented}|]
