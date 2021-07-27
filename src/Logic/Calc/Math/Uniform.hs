module Logic.Calc.Math.Uniform ( factorial
                    , Error(..)
                    , Result
                    ) where

import qualified Logic.Calc.Math.Diverse as M
import Logic.Calc.Math.Error ( Error(..), Result )

type Value = Float

factorial :: Value -> Result Value
factorial x = let truncatedVal = truncate x
              in if x == fromIntegral truncatedVal then Right $ fromInteger $ M.factorial truncatedVal
                                                   else Left FractionFactorial
