module Main where

import System.Environment ( getArgs )

import Logic ( process )


main :: IO ()
main = getArgs >>= either print putStrLn . process
