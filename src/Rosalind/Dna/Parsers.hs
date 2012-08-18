module Rosalind.Dna.Parsers
    ( parseDnaBase
    , parseDna
    , parseDnaPair
    ) where

import Control.Applicative ((<$>), (<*>), (<|>))

import Data.Attoparsec.Text (Parser, anyChar, endOfInput, endOfLine, manyTill)

import Rosalind.Dna.Types (DnaBase(..), Dna(..))

parseDnaBase :: Parser DnaBase
parseDnaBase = do
    anyChar >>= \c -> case c of 
        'A' -> return $ DnaBaseA
        'C' -> return $ DnaBaseC
        'G' -> return $ DnaBaseG
        'T' -> return $ DnaBaseT
        r   -> fail $ "Invalid base: " ++ [r]

parseDna :: Parser Dna
parseDna = Dna <$> manyTill parseDnaBase (endOfInput <|> endOfLine)

parseDnaPair :: Parser (Dna, Dna)
parseDnaPair = (,) <$> parseDna
                   <*> parseDna