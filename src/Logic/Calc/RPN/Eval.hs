module Logic.Calc.RPN.Eval ( eval ) where

import Control.Arrow ( (>>>) )
import Control.Monad ( foldM )

import Logic.Calc.Math.Error ( Result )
import Logic.Calc.Math.Uniform ( factorial )

import Logic.Calc.RPN.Structure ( RPN, Token(..), Value )


eval :: RPN -> Result Value
eval = foldM foldRPN [] >>> (>>= extractResult)
    where
        foldRPN :: [Value] -> Token -> Result [Value]
        foldRPN stack     (Number a)     = Right $ a:stack
        foldRPN (h0:h1:t) (Operator op)  = Right $ (h1 `op` h0):t
        foldRPN (h:t)     (Function f)   = Right $ f h:t
        foldRPN (h:t)     (RFunction f)  = (:t) <$> f h

        foldRPN _         (Operator _)   = error ""
        foldRPN _         (Function _)   = error ""
        foldRPN _         (RFunction _)  = error ""

        -- TODO: Wait for `RPN.Make` to do the parsing.
        extractResult :: [Value] -> Result Value
        extractResult l = case length l `compare` 1 of
          EQ -> Right $ head l
          LT -> error ""
          GT -> error ""
