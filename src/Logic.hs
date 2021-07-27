module Logic ( process ) where

import Control.Arrow ( left )
import Control.Monad ( (<=<) )

import Logic.Error ( Error(..), Result )
import Logic.Args ( Args, parse )
import Logic.Calc ( calc )


-- Run all the programs logic that does not need IO.
process :: Args -> Result String
process = (show <$>) . (left CalcError . calc <=< left ArgsError . parse)
