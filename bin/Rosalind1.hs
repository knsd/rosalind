module Main where

import Prelude hiding (putStrLn, getContents)

import Data.Text.IO (getContents, putStrLn)

import Problems.Problem1 (problem)

main :: IO ()
main = getContents >>= putStrLn . problem
