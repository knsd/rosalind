module Rosalind
    ( module Rosalind.Rna
    , module Rosalind.Dna
    , module Rosalind.Utils
    , dnaBase2RnaBase
    ) where

import Rosalind.Rna
import Rosalind.Dna
import Rosalind.Utils
import Rosalind.Instances ()

dnaBase2RnaBase :: DnaBase -> RnaBase
dnaBase2RnaBase DnaBaseA = RnaBaseA
dnaBase2RnaBase DnaBaseC = RnaBaseC
dnaBase2RnaBase DnaBaseG = RnaBaseG
dnaBase2RnaBase DnaBaseT = RnaBaseU
