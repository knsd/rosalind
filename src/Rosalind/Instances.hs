{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleInstances #-}

module Rosalind.Instances () where

import Prelude hiding (concat)

import Data.Text.Lazy (intercalate, concat, pack)

import Rosalind.Dna (DnaBase(..), DnaBaseConensus(..), DnaBaseMatrixProfile(..))
import Rosalind.Rna (RnaBase(..))
import Rosalind.Codon (Codon(..))
import Rosalind.Utils (ToText(toText))

instance ToText Codon where
    toText CodonA = "A"
    toText CodonC = "C"
    toText CodonE = "E"
    toText CodonD = "D"
    toText CodonG = "G"
    toText CodonF = "F"
    toText CodonI = "I"
    toText CodonH = "H"
    toText CodonK = "K"
    toText CodonM = "M"
    toText CodonL = "L"
    toText CodonN = "N"
    toText CodonQ = "Q"
    toText CodonP = "P"
    toText CodonS = "S"
    toText CodonR = "R"
    toText CodonT = "T"
    toText CodonW = "W"
    toText CodonV = "V"
    toText CodonY = "Y"
    toText CodonStop = "Stop"

instance ToText DnaBase where
    toText DnaBaseA = "A"
    toText DnaBaseC = "C"
    toText DnaBaseG = "G"
    toText DnaBaseT = "T"

instance ToText RnaBase where
    toText RnaBaseA = "A"
    toText RnaBaseC = "C"
    toText RnaBaseG = "G"
    toText RnaBaseU = "U"

instance ToText [Codon] where
    toText = concat . map toText

instance ToText [DnaBase] where
    toText = concat . map toText

instance ToText [RnaBase] where
    toText = concat . map toText

instance ToText DnaBaseConensus where
    toText (DnaBaseConensus bases) = toText bases

instance ToText DnaBaseMatrixProfile where
    toText (DnaBaseMatrixProfile (as, cs, gs, ts)) =
        toText $ intercalate "\n"
            [ intercalate " " $ "A:" : map (pack . show) as
            , intercalate " " $ "C:" : map (pack . show) cs
            , intercalate " " $ "G:" : map (pack . show) gs
            , intercalate " " $ "T:" : map (pack . show) ts
            ]