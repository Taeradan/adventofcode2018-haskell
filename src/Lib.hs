{-# LANGUAGE OverloadedStrings #-}
module Lib where

import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import Data.Text.Read
import Data.Either

computeDay1_1 :: IO Integer
computeDay1_1 = do
    contents <- TIO.readFile "resources/day1"
    let integers = map fst . rights . map (\ x -> signed decimal x) . T.lines $ contents
    return $ sum integers


