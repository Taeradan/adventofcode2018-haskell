module Lib where

import qualified Data.ByteString.Char8         as C
import           Data.List                      ( find
                                                , elemIndex
                                                , nub
                                                , sortOn
                                                )
import           Data.Maybe
import           Data.Ord

computeDay1_1 :: C.ByteString -> Int
computeDay1_1 = sum . parseIntegers

computeDay1_2 :: C.ByteString -> Maybe Int
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

computeDay2_2 :: C.ByteString -> String
computeDay2_2 text =
  head . sortOn (Data.Ord.Down . length) . map orderedIntersection $ pairs
 where
  lines               = map C.unpack . C.lines $ text
  pairs               = [ (x, y) | x <- lines, y <- lines, x /= y ]
  orderedIntersection = map fst . filter (uncurry (==)) . uncurry zip

parseIntegers :: C.ByteString -> [Int]
parseIntegers = map fst . mapMaybe C.readInt . C.lines
