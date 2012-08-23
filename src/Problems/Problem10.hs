module Problems.Problem10 where

import Data.Text.Lazy (Text)

import Rosalind (RnaBase, Codon(..), rnaTriplet2Codon, parseRnaBases, parse,
                 toText)

rnaBasesToCodons :: [RnaBase] -> Maybe [Codon]
rnaBasesToCodons [a, b, c]
  | rnaTriplet2Codon (a, b, c) == CodonStop = Just []
  | otherwise                               = Nothing
rnaBasesToCodons (a:b:c:xs) = do
    t <- rnaBasesToCodons xs
    return $ rnaTriplet2Codon (a, b, c) : t
rnaBasesToCodons _ = Nothing

problem :: Text -> Text
problem t = case parse parseRnaBases t of
    Left err -> error $ "Invalid input. " ++ err
    Right bases -> case rnaBasesToCodons bases of
        Just codons -> toText codons
        Nothing     -> error "Invalid RNA string."
