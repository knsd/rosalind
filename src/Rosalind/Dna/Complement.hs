module Rosalind.Dna.Complement
    ( complement
    ) where

import Rosalind.Dna.Types (DnaBase(..))

complement :: DnaBase -> DnaBase
complement DnaBaseA = DnaBaseT
complement DnaBaseC = DnaBaseG
complement DnaBaseG = DnaBaseC
complement DnaBaseT = DnaBaseA
