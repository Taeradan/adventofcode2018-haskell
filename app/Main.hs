module Main where

import Lib

main :: IO ()
main = do
    computeDay1_1 >>= (\x -> putStrLn $ "day1 : " ++ show x)
