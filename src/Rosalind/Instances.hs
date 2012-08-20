{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleInstances #-}

module Rosalind.Instances () where

import Prelude hiding (concat)

import Data.Text.Lazy (intercalate, concat, pack)

import Rosalind.Dna (DnaBase(..), DnaBaseConensus(..), DnaBaseMatrixProfile(..))
import Rosalind.Rna (RnaBase(..))
import Rosalind.Utils (ToText(toText))

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