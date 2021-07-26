module Calc ( calc
            , Error(..)
            , Result
            ) where

import Control.Arrow ( (>>>), left )

import qualified RPN.Make as RPN ( make )
import qualified RPN.Eval as RPN ( eval
                                 , RPN
                                 , Value
                                 )
import Error ( Error(..), Result, mathResult)


calc :: String -> Result RPN.Value
calc = words >>> RPN.make >>> left RpnError >>> (>>= RPN.eval >>> left MathError)
