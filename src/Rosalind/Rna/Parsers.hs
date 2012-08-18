module Rosalind.Rna.Parsers
    ( parseRnaBase
    , parseRna
    ) where

import Control.Applicative ((<$>), (<|>))

import Data.Attoparsec.Text (Parser, anyChar, endOfInput, endOfLine, manyTill)

import Rosalind.Rna.Types (RnaBase(..), Rna(..))

parseRnaBase :: Parser RnaBase
parseRnaBase = do
    anyChar >>= \c -> case c of 
        'A' -> return $ RnaBaseA
        'C' -> return $ RnaBaseC
        'G' -> return $ RnaBaseG
        'U' -> return $ RnaBaseU
        r   -> fail $ "Invalid base: " ++ [r]

parseRna :: Parser Rna
parseRna = Rna <$> manyTill parseRnaBase (endOfInput <|> endOfLine)
