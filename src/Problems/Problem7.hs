{-# LANGUAGE OverloadedStrings #-}

module Problems.Problem7 where

import Data.Attoparsec.Text (decimal, parseOnly)
import Data.Text (Text, intercalate)

import Data.List (delete)

import Rosalind (toText)

permutate :: Int -> [[Int]]
permutate n = go [1..n]
  where
    go [] = [[]]
    go xs = [x:ys | x <- xs, ys <- go $ delete x xs]

problem :: Text -> Text
problem t = case parseOnly decimal t of
    Left err -> error $ "Invalid input. " ++ err
    Right n -> let permutations = permutate n in intercalate "\n" $
        (:) (toText $ product [1..n])
          $ map (intercalate " " . map toText) permutations
