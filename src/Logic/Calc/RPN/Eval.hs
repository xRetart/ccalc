module Logic.Calc.RPN.Eval ( eval
                           , Result
                           , Value
                           , RPN
                           ) where

import qualified Data.Map as M

import Data.Maybe ( fromMaybe )
import Control.Arrow ( (>>>) )
import Control.Monad ( foldM )

import Logic.Calc.Math.Error ( Result )
import Logic.Calc.Math.Uniform ( factorial )

import Logic.Calc.RPN.Structure ( Token(..)
                                , Value
                                , RPN
                                )


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
        -- foldRPN _         (Operator _)  = rpnResult ExtraneousOperator
        -- foldRPN _         (Function _)  = rpnResult ExtraneousFunction
        -- foldRPN _         (RFunction _)  = rpnResult ExtraneousFunction

        extractResult :: [Value] -> Result Value
        extractResult l = case len of EQ -> Right $ head l
                                    --   LT -> rpnResult MissingExpression
                                    --   GT -> rpnResult ExtraneousOperand
                                      LT -> error ""
                                      GT -> error ""
            where len = length l `compare` 1
        
