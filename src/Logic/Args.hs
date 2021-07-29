module Logic.Args ( parse, Args ) where

import Logic.Args.Error ( Error(..), Result )


type Args = [String]


-- Extract "valid" input from arguments and
-- put it into format where `calc` can use it.
parse :: [String] -> Result String
parse l = case length l `compare` 1 of
    LT -> Left TooLittle
    EQ -> Right $ head l
    GT -> Left TooMany
