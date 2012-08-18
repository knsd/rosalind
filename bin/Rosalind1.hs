{-# LANGUAGE QuasiQuotes #-}

module Main where

import Prelude hiding (putStrLn, getContents)
import Control.Applicative ((<$>))

import Data.Text.IO (getContents, putStrLn)

import Rosalind (RnaBase(..), Rna(..), parseRna, st, parseOnly)

countRnaBases :: Rna -> (Int, Int, Int, Int)
countRnaBases (Rna bases) = foldl foldFunc (0, 0, 0, 0) bases
  where
    foldFunc (as, cs, gs, us) RnaBaseA = (as + 1, cs, gs, us)
    foldFunc (as, cs, gs, us) RnaBaseC = (as, cs + 1, gs, us)
    foldFunc (as, cs, gs, us) RnaBaseG = (as, cs, gs + 1, us)
    foldFunc (as, cs, gs, us) RnaBaseU = (as, cs, gs, us + 1)

main :: IO ()
main = getContents >>= \t -> case countRnaBases <$> parseOnly parseRna t of
        Left err -> error $ "Invalid input. " ++ err
        Right (as, cs, gs, us) -> putStrLn [st|#{as} #{cs} #{gs} #{us}|]
