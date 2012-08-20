{-# LANGUAGE TemplateHaskell #-}

module Main where

import Data.ByteString (ByteString)
import Data.ByteString.Lazy (fromChunks)

import Data.Text.Lazy (Text)
import Data.Text.Lazy.Encoding (decodeUtf8)
import Data.FileEmbed (embedFile)
import Test.HUnit.Base ((@=?))
import Test.Framework (testGroup, defaultMain)
import Test.Framework.Providers.HUnit (testCase)

import qualified Problems.Problem1 as P1
import qualified Problems.Problem2 as P2
import qualified Problems.Problem3 as P3
import qualified Problems.Problem4 as P4
import qualified Problems.Problem5 as P5
import qualified Problems.Problem6 as P6
import qualified Problems.Problem7 as P7
import qualified Problems.Problem8 as P8
import qualified Problems.Problem9 as P9

cases :: [(String, Text -> Text, [(String, ByteString, ByteString)])]
cases = [ ("problem1", P1.problem,
            [ ( "1"
              , $(embedFile "tests/data/1-1.in")
              , $(embedFile "tests/data/1-1.out")
              )
            ]
          )
        , ("problem2", P2.problem,
            [ ( "1"
              , $(embedFile "tests/data/2-1.in")
              , $(embedFile "tests/data/2-1.out")
              )
            ]
          )
        , ("problem3", P3.problem,
            [ ( "1"
              , $(embedFile "tests/data/3-1.in")
              , $(embedFile "tests/data/3-1.out")
              )
            ]
          )
        , ("problem4", P4.problem,
            [ ( "1"
              , $(embedFile "tests/data/4-1.in")
              , $(embedFile "tests/data/4-1.out")
              )
            ]
          )
        , ("problem5", P5.problem,
            [ ( "1"
              , $(embedFile "tests/data/5-1.in")
              , $(embedFile "tests/data/5-1.out")
              )
            ]
          )
        , ("problem6", P6.problem,
            [ ( "1"
              , $(embedFile "tests/data/6-1.in")
              , $(embedFile "tests/data/6-1.out")
              )
            ]
          )
        , ("problem7", P7.problem,
            [ ( "1"
              , $(embedFile "tests/data/7-1.in")
              , $(embedFile "tests/data/7-1.out")
              )
            ]
          )
        , ("problem8", P8.problem,
            [ ( "1"
              , $(embedFile "tests/data/8-1.in")
              , $(embedFile "tests/data/8-1.out")
              )
            ]
          )
        , ("problem9", P9.problem,
            [ ( "1"
              , $(embedFile "tests/data/9-1.in")
              , $(embedFile "tests/data/9-1.out")
              )
            ]
          )
        ]

main :: IO ()
main = defaultMain groups
  where
    groups = flip map cases $ \(pname, pfun, pcases) ->
        testGroup pname $ flip map pcases $ \(cname, bin, bout) ->
            testCase cname $ let tin  = decodeUtf8 $ fromChunks [bin]
                                 tout = decodeUtf8 $ fromChunks [bout] in
                                     tout @=? pfun tin
