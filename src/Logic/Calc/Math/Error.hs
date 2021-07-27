module Logic.Calc.Math.Error ( Error(..), Result ) where


data Error
    = FractionFactorial
    | RootNeg
    deriving Enum
instance Show Error where
    show err = case err of
        FractionFactorial -> "Factorial of fraction."
        RootNeg           -> "Root of negative number."

type Result = Either Error
