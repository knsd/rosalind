module Rosalind.Rna.Types
    ( RnaBase(..)
    , Rna(..)
    ) where

data RnaBase = RnaBaseA
             | RnaBaseC
             | RnaBaseG
             | RnaBaseU
    deriving (Show, Eq, Ord)

data Rna = Rna [RnaBase]
    deriving (Show, Eq, Ord)
