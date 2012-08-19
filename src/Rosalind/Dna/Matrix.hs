module Rosalind.Dna.Matrix
    ( DnaBaseMatrix(..)
    , DnaBaseMatrixProfile(..)
    , DnaBaseConensus(..)
    , dnaBaseMatrixProfile
    , dnaBaseConcensus
    ) where

import Data.List (zipWith4, maximumBy)
import Data.Function (on)

import Rosalind.Dna.Types (DnaBase(..))

newtype DnaBaseMatrix = DnaBaseMatrix [[DnaBase]]
    deriving Show

newtype DnaBaseMatrixProfile = DnaBaseMatrixProfile ([Int], [Int], [Int], [Int])
    deriving Show

newtype DnaBaseConensus = DnaBaseConensus [DnaBase]
    deriving Show

rotate :: [[a]] -> [[a]]
rotate = foldr (zipWith (:)) (repeat [])

dnaBaseMatrixProfile :: DnaBaseMatrix -> DnaBaseMatrixProfile
dnaBaseMatrixProfile (DnaBaseMatrix matrix) = DnaBaseMatrixProfile $
    foldl foldFunc ([], [], [], []) $ rotate $ map reverse matrix
  where
    foldFunc (as, cs, gs, ts) col = ( (length $ filter (== DnaBaseA) col) : as
                                    , (length $ filter (== DnaBaseC) col) : cs
                                    , (length $ filter (== DnaBaseG) col) : gs
                                    , (length $ filter (== DnaBaseT) col) : ts
                                    )

dnaBaseConcensus :: DnaBaseMatrixProfile -> DnaBaseConensus
dnaBaseConcensus (DnaBaseMatrixProfile (as, cs, gs, ts)) = DnaBaseConensus $
    zipWith4 zipFunc as cs gs ts
  where
    zipFunc a c g t = snd $ maximumBy (compare `on` fst)
        [(a, DnaBaseA), (c, DnaBaseC), (g, DnaBaseG), (t, DnaBaseT)]
