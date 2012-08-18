module Main where

import Prelude hiding (getContents)
import Data.List (isPrefixOf, tails, intercalate)

import Rosalind (Dna(..), parseDnaPair, parseOnly)

import Data.Text.IO (getContents)

main :: IO ()
main = getContents >>= \t -> case parseOnly parseDnaPair t of
        Left err -> error $ "Invalid input. " ++ err
        Right (Dna dna, Dna subdna) -> putStrLn $ intercalate " " $
            map (show . snd) $ filter (isPrefixOf subdna . fst) $
                zip (tails dna) ints
  where
    ints :: [Int]
    ints = [1 ..]
