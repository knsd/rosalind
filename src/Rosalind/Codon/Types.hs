module Rosalind.Codon.Types
    ( Codon(..)
    ) where

data Codon = CodonA
           | CodonC
           | CodonE
           | CodonD
           | CodonG
           | CodonF
           | CodonI
           | CodonH
           | CodonK
           | CodonM
           | CodonL
           | CodonN
           | CodonQ
           | CodonP
           | CodonS
           | CodonR
           | CodonT
           | CodonW
           | CodonV
           | CodonY
           | CodonStop
    deriving (Show, Eq, Ord)
