module Lib where

import qualified Data.Text                     as T
import           Data.Text.Read
import           Data.Either
import           Data.List                      ( find
                                                , elemIndex
                                                )
import           Data.Maybe

computeDay1_1 :: T.Text -> Integer
computeDay1_1 = sum . parseIntegers

computeDay1_2 :: T.Text -> Maybe Integer
computeDay1_2 text = fmap snd . find repeatedElement . zip indices $ sumList
 where
  indices = [0 ..]
  sumList = scanl (+) 0 . cycle . parseIntegers $ text
  repeatedElement (index, value) =
    (>) index . fromJust . elemIndex value $ sumList

computeDay2_1 text = "plooup"

parseIntegers :: T.Text -> [Integer]
parseIntegers = map fst . rights . map (signed decimal) . T.lines
