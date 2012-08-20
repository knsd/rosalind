{-# LANGUAGE RecordWildCards #-}

module Rosalind.Fasta.Parsers
    ( parseFasta
    , parseFastasList
    ) where

import Control.Applicative ((<$>))
import Control.Monad (void, join)

import Data.Attoparsec.Text.Lazy (Parser, anyChar, endOfLine, many1,
                                  manyTill, char, try)
import Data.Text.Lazy (pack)

import Rosalind.Dna (parseDnaBasesList)
import Rosalind.Fasta.Types (Fasta(..))

parseFasta :: Parser Fasta
parseFasta = do
    void $ char '>'
    fastaName <- pack <$> manyTill anyChar endOfLine
    fastaBases <- fmap join $ try parseDnaBasesList
    return $ Fasta { .. }

parseFastasList :: Parser [Fasta]
parseFastasList = many1 parseFasta
