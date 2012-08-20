{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedStrings #-}

module Problems.Problem8 where

import Data.Function (on)
import Data.List (maximumBy)

import Data.Text.Lazy (Text, intercalate)

import Rosalind (Fasta(..), DnaBase(..), Percentage, parseFastasList, parse,
                 toText)

cgContent :: [DnaBase] -> Percentage
cgContent []    = 0
cgContent bases = cgLen / baseLen * 100
  where
    baseLen = fromIntegral $ length bases
    cgLen = fromIntegral $ length $ filter (`elem` [DnaBaseC, DnaBaseG]) bases

problem :: Text -> Text
problem t = case parse parseFastasList t of
    Left err -> error $ "Invalid input. " ++ err
    Right fastas ->
        let (name, persentage) = maximumBy (compare `on` snd ) $
                map (\Fasta {..} -> (fastaName, cgContent fastaBases)) fastas in
                    intercalate "\n" [name, toText persentage]
