module Main where

import Prelude hiding (getContents, putStrLn)

import Data.Text.Lazy.IO (getContents, putStrLn)

import Problems.Problem7 (problem)

main :: IO ()
main = getContents >>= putStrLn . problem
