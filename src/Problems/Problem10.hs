module Problems.Problem10 where

import Data.Text.Lazy (Text)

import Rosalind (RnaBase, Codon(..), rnaTriplet2Codon, parseRnaBases, parse,
                 toText)

rnaBasesToCodons :: [RnaBase] -> Maybe [Codon]
rnaBasesToCodons (a:b:c:xs) = case (rnaTriplet2Codon (a, b, c), xs) of
    (CodonStop, []) -> Just []
    (codon, (_:_))  -> rnaBasesToCodons xs >>= \t -> return $ codon : t
    _               -> Nothing
rnaBasesToCodons _ = Nothing

problem :: Text -> Text
problem t = case parse parseRnaBases t of
    Left err -> error $ "Invalid input. " ++ err
    Right bases -> case rnaBasesToCodons bases of
        Just codons -> toText codons
        Nothing     -> error "Invalid RNA string."
