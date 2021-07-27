module Logic.Calc.Error ( Error(..), Result ) where

import qualified Logic.Calc.Math.Error as Math ( Error )
import qualified Logic.Calc.RPN.Error as RPN ( Error )

 
data Error
    = RpnError RPN.Error
    | MathError Math.Error
type Result = Either Error

instance Show Error where
    show (RpnError err)  = show err
    show (MathError err) = show err
