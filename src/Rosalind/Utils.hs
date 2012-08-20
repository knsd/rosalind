{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}

module Rosalind.Utils
    ( Percentage
    , ToText(toText)
    , parse
    ) where

import Data.Text.Lazy (Text, append)
import Data.Text.Lazy.Builder (toLazyText)
import Data.Text.Lazy.Builder.Int (decimal)
import Data.Text.Lazy.Builder.RealFloat (FPFormat(Fixed), formatRealFloat)
import qualified Data.Attoparsec.Text.Lazy as ATL

newtype Percentage = Percentage Float
    deriving (Eq, Ord, Enum, Num, Real, RealFrac, Floating, Fractional,
              RealFloat)

class ToText a where
    toText :: a -> Text

instance ToText Text where
    toText = id

instance ToText Int where
    toText = toLazyText . decimal

instance ToText Percentage where
    toText i = append (toLazyText $ formatRealFloat Fixed (Just 2) i) "%"

parse :: ATL.Parser a -> Text -> Either String a
parse p t = case ATL.parse p t of
    (ATL.Fail _ _ r ) -> Left r
    (ATL.Done _ r )   -> Right r
