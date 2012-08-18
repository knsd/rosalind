module Rosalind.Utils
    ( st
    , parseOnly
    ) where

import Data.Attoparsec.Text (parseOnly)
import Data.Text.Lazy.Builder.Int (decimal)
import Text.Shakespeare.Text (ToText(toText), st)

instance ToText Int where
    toText = decimal
