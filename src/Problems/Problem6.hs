{-# LANGUAGE OverloadedStrings #-}

module Problems.Problem6 where

import Data.Text.Lazy (Text, intercalate)
import Rosalind (DnaBaseMatrix(..), dnaBaseMatrixProfile,
                dnaBaseConcensus, parseDnaBasesList, parse, toText)

problem :: Text -> Text
problem t = case parse parseDnaBasesList t of
    Left err -> error $ "Invalid input. " ++ err
    Right dnaBases ->
        let matrix = DnaBaseMatrix dnaBases
            profile = dnaBaseMatrixProfile matrix
            concensus = dnaBaseConcensus profile in
                intercalate "\n" [toText concensus, toText profile]