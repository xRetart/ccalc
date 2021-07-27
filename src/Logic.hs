module Logic ( process ) where

import Control.Arrow ( (>>>), left )
import Data.Functor ( (<&>) )

import Logic.Args ( Args, parse )

import Logic.Calc ( calc )
import Logic.Error ( Error(..), Result )


-- Run all the programs logic that does not need IO.
process :: Args -> Result String
process = parse >>> left ArgsError >>> (>>= (calc >>> left CalcError)) >>> (<&> show)
