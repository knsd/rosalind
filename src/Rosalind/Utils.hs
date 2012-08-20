module Rosalind.Utils
    ( ToText(toText)
    , parse
    ) where

import Data.Text.Lazy (Text, pack)
import qualified Data.Attoparsec.Text.Lazy as ATL

class ToText a where
    toText :: a -> Text

instance ToText Text where
    toText = id

instance ToText Int where
    toText = pack . show

parse :: ATL.Parser a -> Text -> Either String a
parse p t = case ATL.parse p t of
    (ATL.Fail _ _ r ) -> Left r
    (ATL.Done _ r )   -> Right r
