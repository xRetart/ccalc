module Logic.Error ( Error(..), Result ) where

import qualified Logic.Calc.Error as Calc ( Error )
import qualified Logic.Args.Error as Args ( Error )


data Error
    = ArgsError Args.Error
    | CalcError Calc.Error
type Result = Either Error

instance Show Error where
    show (ArgsError err) = show err
    show (CalcError err) = show err
