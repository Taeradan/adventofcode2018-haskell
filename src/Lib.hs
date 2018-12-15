module Lib where

import qualified Data.ByteString.Char8         as C
import           Data.List                      ( find
                                                , elemIndex
                                                , nub
                                                )
import           Data.Maybe

computeDay1_1 :: C.ByteString -> Integer
computeDay1_1 = sum . parseIntegers

computeDay1_2 :: C.ByteString -> Maybe Integer
computeDay1_2 text = fmap snd . find repeatedElement . zip indices $ sumList
 where
  indices = [0 ..]
  sumList = scanl (+) 0 . cycle . parseIntegers $ text
  repeatedElement (index, value) =
    (>) index . fromJust . elemIndex value $ sumList

computeDay2_1 :: C.ByteString -> Int
computeDay2_1 text = countRepeated 3 * countRepeated 2
 where
  repeatedLettersCountList =
    map (nub . map C.length . C.group . C.sort) . C.lines $ text
  countRepeated x = length . filter (elem x) $ repeatedLettersCountList

parseIntegers :: C.ByteString -> [Integer]
parseIntegers = map fst . mapMaybe C.readInteger . C.lines
