module Logic.Calc.Expression.Eval ( eval ) where

import Control.Arrow ( ArrowChoice(left) )
import Control.Monad ( foldM, (<=<) )

import Logic.Calc.Error ( Error(..), Result )
import Logic.Calc.Expression.Error ( Error(..) )
import Logic.Calc.Math.Uniform ( factorial )
import Logic.Calc.Expression.Structure ( Expression, Lexeme(..), Value )


eval :: Expression -> Result Value
eval = extractResult <=< foldM foldExpression []
    where
        foldExpression :: [Value] -> Lexeme -> Result [Value]
        foldExpression stack     (Literal a)     = Right $ a:stack
        foldExpression (h0:h1:t) (Operator op)  = Right $ (h1 `op` h0):t
        foldExpression (h:t)     (Function f)   = Right $ f h:t
        foldExpression (h:t)     (RFunction f)  = left MathError $ (:t) <$> f h

        foldExpression _         (Operator _)   = Left $ ExpressionError ExtraneousOperand 
        foldExpression _         (Function _)   = Left $ ExpressionError ExtraneousFunction 
        foldExpression _         (RFunction _)  = Left $ ExpressionError ExtraneousFunction 

        extractResult :: [Value] -> Result Value
        extractResult l = case length l `compare` 1 of
          EQ -> Right $ head l
          LT -> Left $ ExpressionError MissingExpression
          GT -> Left $ ExpressionError ExtraneousOperand
