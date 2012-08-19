{-# LANGUAGE QuasiQuotes #-}

module Problems.Problem6 where

import Data.Text (Text)
import Rosalind (DnaBaseMatrix(..), dnaBaseMatrixProfile,
                dnaBaseConcensus, parseDnaBasesList, parseOnly, st)

problem :: Text -> Text
problem t = case parseOnly parseDnaBasesList t of
    Left err -> error $ "Invalid input. " ++ err
    Right dnaBases ->
        let matrix = DnaBaseMatrix dnaBases
            profile = dnaBaseMatrixProfile matrix
            concensus = dnaBaseConcensus profile in
        [st|#{concensus}
#{profile}|]