module Logic.Calc.RPN.Eval ( eval ) where

import Control.Arrow ( ArrowChoice(left) )
import Control.Monad ( foldM, (<=<) )

import Logic.Calc.Error ( Error(..), Result )
import Logic.Calc.RPN.Error ( Error(..) )
import Logic.Calc.Math.Uniform ( factorial )
import Logic.Calc.RPN.Structure ( RPN, Token(..), Value )


eval :: RPN -> Result Value
eval = extractResult <=< foldM foldRPN []
    where
        foldRPN :: [Value] -> Token -> Result [Value]
        foldRPN stack     (Number a)     = Right $ a:stack
        foldRPN (h0:h1:t) (Operator op)  = Right $ (h1 `op` h0):t
        foldRPN (h:t)     (Function f)   = Right $ f h:t
        foldRPN (h:t)     (RFunction f)  = left MathError $ (:t) <$> f h

        foldRPN _         (Operator _)   = Left $ RpnError ExtraneousOperand 
        foldRPN _         (Function _)   = Left $ RpnError ExtraneousFunction 
        foldRPN _         (RFunction _)  = Left $ RpnError ExtraneousFunction 

        extractResult :: [Value] -> Result Value
        extractResult l = case length l `compare` 1 of
          EQ -> Right $ head l
          LT -> Left $ RpnError MissingExpression
          GT -> Left $ RpnError ExtraneousOperand
