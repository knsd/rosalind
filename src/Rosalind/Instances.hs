{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleInstances #-}

module Rosalind.Instances () where

import Data.Monoid (mconcat)

import Text.Shakespeare.Text (ToText(toText))

import Rosalind.Dna (DnaBase(..))
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
