module RPN.Structure ( Token(..)
                     , RPN
                     , Value
                     ) where

import Math.Error ( Result )



type RPN = [Token]

type Value = Float
data Token
    = Number Value
    | Function (Value -> Value)
    | RFunction (Value -> Result Value)
    | Operator (Value -> Value -> Value)
