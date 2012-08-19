{-# LANGUAGE OverloadedStrings #-}

module Problems.Problem6 where

import Data.Text (Text, intercalate)
import Rosalind (DnaBaseMatrix(..), dnaBaseMatrixProfile,
                dnaBaseConcensus, parseDnaBasesList, parseOnly, toText)

problem :: Text -> Text
problem t = case parseOnly parseDnaBasesList t of
    Left err -> error $ "Invalid input. " ++ err
    Right dnaBases ->
        let matrix = DnaBaseMatrix dnaBases
            profile = dnaBaseMatrixProfile matrix
            concensus = dnaBaseConcensus profile in
                intercalate "\n" [toText concensus, toText profile]