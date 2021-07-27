module Logic.Calc ( calc
                  , Error(..)
                  , Result
                  ) where

import Control.Arrow ( (>>>), left )

import qualified Logic.Calc.RPN.Make as RPN ( make )
import qualified Logic.Calc.RPN.Eval as RPN ( eval
                                            , RPN
                                            , Value
                                            )
import Logic.Calc.Error ( Error(..), Result, mathResult)


calc :: String -> Result RPN.Value
calc = words >>> RPN.make >>> left RpnError >>> (>>= RPN.eval >>> left MathError)
