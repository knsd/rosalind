module Rosalind
    ( module Rosalind.Rna
    , module Rosalind.Dna
    , module Rosalind.Codon
    , module Rosalind.Fasta
    , module Rosalind.Utils
    , dnaBase2RnaBase
    , rnaTriplet2Codon
    ) where

import Rosalind.Rna
import Rosalind.Dna
import Rosalind.Codon
import Rosalind.Fasta
import Rosalind.Utils
import Rosalind.Instances ()

dnaBase2RnaBase :: DnaBase -> RnaBase
dnaBase2RnaBase DnaBaseA = RnaBaseA
dnaBase2RnaBase DnaBaseC = RnaBaseC
dnaBase2RnaBase DnaBaseG = RnaBaseG
dnaBase2RnaBase DnaBaseT = RnaBaseU

rnaTriplet2Codon :: (RnaBase, RnaBase, RnaBase) -> Codon
rnaTriplet2Codon (RnaBaseU, RnaBaseU, RnaBaseU) = CodonF
rnaTriplet2Codon (RnaBaseC, RnaBaseU, RnaBaseU) = CodonL
rnaTriplet2Codon (RnaBaseA, RnaBaseU, RnaBaseU) = CodonI
rnaTriplet2Codon (RnaBaseG, RnaBaseU, RnaBaseU) = CodonV
rnaTriplet2Codon (RnaBaseU, RnaBaseU, RnaBaseC) = CodonF
rnaTriplet2Codon (RnaBaseC, RnaBaseU, RnaBaseC) = CodonL
rnaTriplet2Codon (RnaBaseA, RnaBaseU, RnaBaseC) = CodonI
rnaTriplet2Codon (RnaBaseG, RnaBaseU, RnaBaseC) = CodonV
rnaTriplet2Codon (RnaBaseU, RnaBaseU, RnaBaseA) = CodonL
rnaTriplet2Codon (RnaBaseC, RnaBaseU, RnaBaseA) = CodonL
rnaTriplet2Codon (RnaBaseA, RnaBaseU, RnaBaseA) = CodonI
rnaTriplet2Codon (RnaBaseG, RnaBaseU, RnaBaseA) = CodonV
rnaTriplet2Codon (RnaBaseU, RnaBaseU, RnaBaseG) = CodonL
rnaTriplet2Codon (RnaBaseC, RnaBaseU, RnaBaseG) = CodonL
rnaTriplet2Codon (RnaBaseA, RnaBaseU, RnaBaseG) = CodonM
rnaTriplet2Codon (RnaBaseG, RnaBaseU, RnaBaseG) = CodonV
rnaTriplet2Codon (RnaBaseU, RnaBaseC, RnaBaseU) = CodonS
rnaTriplet2Codon (RnaBaseC, RnaBaseC, RnaBaseU) = CodonP
rnaTriplet2Codon (RnaBaseA, RnaBaseC, RnaBaseU) = CodonT
rnaTriplet2Codon (RnaBaseG, RnaBaseC, RnaBaseU) = CodonA
rnaTriplet2Codon (RnaBaseU, RnaBaseC, RnaBaseC) = CodonS
rnaTriplet2Codon (RnaBaseC, RnaBaseC, RnaBaseC) = CodonP
rnaTriplet2Codon (RnaBaseA, RnaBaseC, RnaBaseC) = CodonT
rnaTriplet2Codon (RnaBaseG, RnaBaseC, RnaBaseC) = CodonA
rnaTriplet2Codon (RnaBaseU, RnaBaseC, RnaBaseA) = CodonS
rnaTriplet2Codon (RnaBaseC, RnaBaseC, RnaBaseA) = CodonP
rnaTriplet2Codon (RnaBaseA, RnaBaseC, RnaBaseA) = CodonT
rnaTriplet2Codon (RnaBaseG, RnaBaseC, RnaBaseA) = CodonA
rnaTriplet2Codon (RnaBaseU, RnaBaseC, RnaBaseG) = CodonS
rnaTriplet2Codon (RnaBaseC, RnaBaseC, RnaBaseG) = CodonP
rnaTriplet2Codon (RnaBaseA, RnaBaseC, RnaBaseG) = CodonT
rnaTriplet2Codon (RnaBaseG, RnaBaseC, RnaBaseG) = CodonA
rnaTriplet2Codon (RnaBaseU, RnaBaseA, RnaBaseU) = CodonY
rnaTriplet2Codon (RnaBaseC, RnaBaseA, RnaBaseU) = CodonH
rnaTriplet2Codon (RnaBaseA, RnaBaseA, RnaBaseU) = CodonN
rnaTriplet2Codon (RnaBaseG, RnaBaseA, RnaBaseU) = CodonD
rnaTriplet2Codon (RnaBaseU, RnaBaseA, RnaBaseC) = CodonY
rnaTriplet2Codon (RnaBaseC, RnaBaseA, RnaBaseC) = CodonH
rnaTriplet2Codon (RnaBaseA, RnaBaseA, RnaBaseC) = CodonN
rnaTriplet2Codon (RnaBaseG, RnaBaseA, RnaBaseC) = CodonD
rnaTriplet2Codon (RnaBaseU, RnaBaseA, RnaBaseA) = CodonStop
rnaTriplet2Codon (RnaBaseC, RnaBaseA, RnaBaseA) = CodonQ
rnaTriplet2Codon (RnaBaseA, RnaBaseA, RnaBaseA) = CodonK
rnaTriplet2Codon (RnaBaseG, RnaBaseA, RnaBaseA) = CodonE
rnaTriplet2Codon (RnaBaseU, RnaBaseA, RnaBaseG) = CodonStop
rnaTriplet2Codon (RnaBaseC, RnaBaseA, RnaBaseG) = CodonQ
rnaTriplet2Codon (RnaBaseA, RnaBaseA, RnaBaseG) = CodonK
rnaTriplet2Codon (RnaBaseG, RnaBaseA, RnaBaseG) = CodonE
rnaTriplet2Codon (RnaBaseU, RnaBaseG, RnaBaseU) = CodonC
rnaTriplet2Codon (RnaBaseC, RnaBaseG, RnaBaseU) = CodonR
rnaTriplet2Codon (RnaBaseA, RnaBaseG, RnaBaseU) = CodonS
rnaTriplet2Codon (RnaBaseG, RnaBaseG, RnaBaseU) = CodonG
rnaTriplet2Codon (RnaBaseU, RnaBaseG, RnaBaseC) = CodonC
rnaTriplet2Codon (RnaBaseC, RnaBaseG, RnaBaseC) = CodonR
rnaTriplet2Codon (RnaBaseA, RnaBaseG, RnaBaseC) = CodonS
rnaTriplet2Codon (RnaBaseG, RnaBaseG, RnaBaseC) = CodonG
rnaTriplet2Codon (RnaBaseU, RnaBaseG, RnaBaseA) = CodonStop
rnaTriplet2Codon (RnaBaseC, RnaBaseG, RnaBaseA) = CodonR
rnaTriplet2Codon (RnaBaseA, RnaBaseG, RnaBaseA) = CodonR
rnaTriplet2Codon (RnaBaseG, RnaBaseG, RnaBaseA) = CodonG
rnaTriplet2Codon (RnaBaseU, RnaBaseG, RnaBaseG) = CodonW
rnaTriplet2Codon (RnaBaseC, RnaBaseG, RnaBaseG) = CodonR
rnaTriplet2Codon (RnaBaseA, RnaBaseG, RnaBaseG) = CodonR
rnaTriplet2Codon (RnaBaseG, RnaBaseG, RnaBaseG) = CodonG
