{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleInstances #-}

module Rosalind.Instances () where

import Data.Monoid (mconcat)

import Data.Text (intercalate, pack)
import Text.Shakespeare.Text (ToText(toText))

import Rosalind.Dna (DnaBase(..), DnaBaseConensus(..), DnaBaseMatrixProfile(..))
import Rosalind.Rna (RnaBase(..))

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
    toText = mconcat . map toText

instance ToText [RnaBase] where
    toText = mconcat . map toText

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