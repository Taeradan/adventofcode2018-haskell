module Lib where

import qualified Data.Text                     as T
import           Data.Text.Read
import           Data.Either

computeDay1_1 :: T.Text -> Integer
computeDay1_1 = sum . parseIntegers

parseIntegers :: T.Text -> [Integer]
parseIntegers = map fst . rights . map (signed decimal) . T.lines
