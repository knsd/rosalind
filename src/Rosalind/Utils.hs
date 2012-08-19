module Rosalind.Utils
    ( ToText(toText)
    , parseOnly
    ) where

import Data.Text (Text, pack)
import Data.Attoparsec.Text (parseOnly)

class ToText a where
    toText :: a -> Text

instance ToText Text where
    toText = id

instance ToText Int where
    toText = pack . show
