module Rosalind.Dna.Types
    ( DnaBase(..)
    , Dna(..)
    ) where

data DnaBase = DnaBaseA
             | DnaBaseC
             | DnaBaseG
             | DnaBaseT
    deriving (Show, Eq, Ord)

data Dna = Dna [DnaBase]
    deriving (Show, Eq, Ord)
