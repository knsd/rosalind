{-# LANGUAGE OverloadedStrings #-}

module Problems.Problem1 where

import Control.Applicative ((<$>))

import Data.Text (Text, intercalate)

import Rosalind (RnaBase(..), parseRnaBases, parseOnly, toText)

countRnaBases :: [RnaBase] -> (Int, Int, Int, Int)
countRnaBases = foldl foldFunc (0, 0, 0, 0)
  where
    foldFunc (as, cs, gs, us) RnaBaseA = (as + 1, cs, gs, us)
    foldFunc (as, cs, gs, us) RnaBaseC = (as, cs + 1, gs, us)
    foldFunc (as, cs, gs, us) RnaBaseG = (as, cs, gs + 1, us)
    foldFunc (as, cs, gs, us) RnaBaseU = (as, cs, gs, us + 1)

problem :: Text -> Text
problem t = case countRnaBases <$> parseOnly parseRnaBases t of
    Left err -> error $ "Invalid input. " ++ err
    Right (as, cs, gs, us) -> intercalate " " $ map toText [as, cs, gs, us]
