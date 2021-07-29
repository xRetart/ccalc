module Logic.Calc.Error ( Error(..), Result ) where

import qualified Logic.Calc.Math.Error as Math ( Error )
import qualified Logic.Calc.Expression.Error as Expression ( Error )

 
-- Combination of ExpressionError and Math error and
-- the type to hold all possible errors occured during calculation.
data Error
    = ExpressionError Expression.Error
    | MathError Math.Error
type Result = Either Error

instance Show Error where
    show (ExpressionError err)  = show err
    show (MathError err) = show err
