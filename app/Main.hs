module Main where

import           Lib
import qualified Data.Text.IO                  as TIO

main :: IO ()
main = do
  day1_input <- TIO.readFile "resources/day1"
  putStrLn $ "day 1.1 : " ++ show (computeDay1_1 day1_input)
  putStrLn $ "day 1.2 : " ++ show (computeDay1_2 day1_input)
