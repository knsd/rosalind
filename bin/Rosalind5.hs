{-# LANGUAGE QuasiQuotes #-}

module Main where

import Prelude hiding (putStrLn, getContents)

import Data.Text.IO (getContents, putStrLn)

import Rosalind (Dna(..), parseDna, dnaBase2RnaBase, parseOnly, st)

main :: IO ()
main = getContents >>= \t -> case parseOnly parseDna t of
        Left err -> error $ "Invalid input. " ++ err
        Right (Dna dnaBases) ->
            let rnaBases = map dnaBase2RnaBase dnaBases in
                putStrLn [st|#{rnaBases}|]
