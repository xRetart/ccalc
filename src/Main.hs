module Main where

import System.Environment ( getArgs )

import Logic ( process
             , ProcessError(..)
             , ProcessResult
             )


main :: IO ()
main = getArgs >>= either print putStrLn . process
