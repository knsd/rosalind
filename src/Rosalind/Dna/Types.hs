module Rosalind.Dna.Types
    ( DnaBase(..)
    ) where

data DnaBase = DnaBaseA
             | DnaBaseC
             | DnaBaseG
             | DnaBaseT
    deriving (Show, Eq, Ord)
