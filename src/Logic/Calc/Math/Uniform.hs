module Logic.Calc.Math.Uniform ( factorial ) where

import qualified Logic.Calc.Math.Diverse as Diverse ( factorial )
import Logic.Calc.Math.Error ( Error(..), Result )


type Value = Float

factorial :: Value -> Result Value
factorial x =
    let truncatedVal = truncate x
    in if x == fromIntegral truncatedVal
        then Right $ fromInteger $ Diverse.factorial truncatedVal
        else Left FractionFactorial
