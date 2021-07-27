module Logic.Calc ( calc ) where

import Control.Arrow ( left )
import Control.Monad ( (<=<) )

import Logic.Calc.Error ( Error(..), Result )

import Logic.Calc.RPN.Structure ( Value )
import Logic.Calc.RPN.Parse ( parse )
import Logic.Calc.RPN.Eval ( eval )


calc :: String -> Result Value
calc = (left MathError . eval) <=< (left RpnError . parse . words)
