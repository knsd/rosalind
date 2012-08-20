{-# LANGUAGE OverloadedStrings #-}

module Problems.Problem7 where

import Data.Attoparsec.Text.Lazy (decimal)
import Data.Text.Lazy (Text, intercalate)

import Data.List (delete)

import Rosalind (parse, toText)

permutate :: Int -> [[Int]]
permutate n = go [1..n]
  where
    go [] = [[]]
    go xs = [x:ys | x <- xs, ys <- go $ delete x xs]

problem :: Text -> Text
problem t = case parse decimal t of
    Left err -> error $ "Invalid input. " ++ err
    Right n -> let permutations = permutate n in intercalate "\n" $
        (:) (toText $ product [1..n])
          $ map (intercalate " " . map toText) permutations
