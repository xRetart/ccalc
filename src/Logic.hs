module Logic ( process
             , Args.Args(..)
             , ProcessError(..)
             , ProcessResult
             ) where

import Control.Arrow ( (>>>), left )
import Data.Functor ( (<&>) )

import qualified Args ( Error(..), parse )
import Args ( Args )

import qualified Error as Calc ( Error )
import Calc ( calc )


data ProcessError
    = ArgsError Args.Error
    | CalcError Calc.Error
type ProcessResult = Either ProcessError

instance Show ProcessError where
    show (ArgsError err) = show err
    show (CalcError err)  = show err


-- Run all the programs logic that does not need IO.
process :: Args -> ProcessResult String
process = Args.parse >>> left ArgsError >>> (>>= (calc >>> left  CalcError)) >>> (<&> show)
