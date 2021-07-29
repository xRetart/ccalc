module Logic.Calc ( calc ) where

import Control.Arrow ( left )
import Control.Monad ( (<=<) )

import Logic.Utils ( maybeToEither )
import Logic.Calc.Error ( Error(..), Result )
import Logic.Calc.Expression.Error ( Error(UnknownExpression) )
import Logic.Calc.Expression.Structure ( Value )
import Logic.Calc.Expression.Parse ( parse )
import Logic.Calc.Expression.Eval ( eval )


-- Calculate the value of an expression
-- in the postfix- or reverse polish notation (Expression).
calc :: String -> Result Value
calc = eval <=< maybeToEither (ExpressionError UnknownExpression) . parse . words
