module Logic.Calc.Error ( Error(..)
                        , Result
                        , rpnResult
                        , mathResult
                        ) where

import Control.Arrow ( (>>>) )

import qualified Logic.Calc.Math.Error as Math ( Error(..) )
import qualified Logic.Calc.RPN.Error as RPN ( Error(..) )


data Error
    = RpnError RPN.Error
    | MathError Math.Error
instance Show Error where
    show (RpnError err)  = show err
    show (MathError err) = show err


type Result = Either Error

-- Shortcut for constructing a `Result` (`Either Error`)
-- of type `RpnError` and `MathError` respectively.
rpnResult :: RPN.Error -> Result a
rpnResult = RpnError >>> Left 

mathResult :: Math.Error -> Result a
mathResult = MathError >>> Left 
