module Main where

import System.Environment ( getArgs )

import Logic ( process )


main :: IO ()
main = either print putStrLn . process =<< getArgs 
