module Logic.Args ( parse, Args ) where

import Logic.Args.Error ( Error(..), Result )


type Args = [String]


parse :: [String] -> Result String
parse l = case length l `compare` 1 of
    LT -> Left TooLittle
    EQ -> Right $ head l
    GT -> Left TooMany
