module Rosalind.Fasta.Types
    ( Fasta(..)
    ) where

import Data.Text.Lazy (Text)

import Rosalind.Dna (DnaBase)

data Fasta = Fasta
    { fastaName :: Text
    , fastaBases :: [DnaBase]
    } deriving (Show)
