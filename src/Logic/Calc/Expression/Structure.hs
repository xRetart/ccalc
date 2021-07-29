module Logic.Calc.Expression.Structure ( Lexeme(..), Expression, Value ) where

import Logic.Calc.Math.Error ( Result )



-- Representation of a parsed structured reverse polish notation expresion.
type Expression = [Lexeme]

-- Data type used to represent any single value of an expression.
type Value = Float
-- Polymorphic way of representing every possible element of an expression.
data Lexeme
    = Literal Value
    | Function (Value -> Value)
    | RFunction (Value -> Result Value)
    | Operator (Value -> Value -> Value)
