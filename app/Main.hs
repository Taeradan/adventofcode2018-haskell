module Main where

import           Lib
import qualified Data.ByteString as B

resourcesPath = "resources/"

main :: IO ()
main = do
  day1_input <- B.readFile $ resourcesPath ++ "day1"
  putStrLn $ "day 1.1 : " ++ show (computeDay1_1 day1_input)
  --putStrLn $ "day 1.2 : " ++ show (computeDay1_2 day1_input)
  day2_input <- B.readFile $ resourcesPath ++ "day2"
  putStrLn $ "day 2.1 : " ++ show (computeDay2_1 day2_input)

