module Rosalind.Rna.Types
    ( RnaBase(..)
    ) where

data RnaBase = RnaBaseA
             | RnaBaseC
             | RnaBaseG
             | RnaBaseU
    deriving (Show, Eq, Ord)
