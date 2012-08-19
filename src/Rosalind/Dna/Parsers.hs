module Rosalind.Dna.Parsers
    ( parseDnaBase
    , parseDnaBases
    , parseDnaBasesPair
    , parseDnaBasesList
    ) where

import Control.Applicative ((<$>), (<*>), (<|>))

import Data.Attoparsec.Text (Parser, anyChar, endOfInput, endOfLine, manyTill)

import Rosalind.Dna.Types (DnaBase(..))

parseDnaBase :: Parser DnaBase
parseDnaBase = do
    anyChar >>= \c -> case c of 
        'A' -> return $ DnaBaseA
        'C' -> return $ DnaBaseC
        'G' -> return $ DnaBaseG
        'T' -> return $ DnaBaseT
        r   -> fail $ "Invalid base: " ++ [r]

parseDnaBases :: Parser [DnaBase]
parseDnaBases = manyTill parseDnaBase (endOfInput <|> endOfLine)

parseDnaBasesPair :: Parser ([DnaBase], [DnaBase])
parseDnaBasesPair = (,) <$> parseDnaBases
                        <*> parseDnaBases

parseDnaBasesList :: Parser [[DnaBase]]
parseDnaBasesList = manyTill (manyTill parseDnaBase endOfLine) endOfInput
