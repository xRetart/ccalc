module Args ( Args
            , Error(..)
            , parse
            ) where



type Args = [String]

-- ...
-- Describing an Error occured while parsing command line arguments.
data Error
    = TooLittle
    | TooMany
    deriving ( Enum, Bounded )
type Result = Either Error

instance Show Error where
    show TooLittle = "Not enough arguments."
    show TooMany = "Too many arguments."


parse :: [String] -> Result String
parse l = case lenAgainstOne of LT -> Left TooLittle
                                EQ -> Right $ head l
                                GT -> Left TooMany
    where lenAgainstOne = length l `compare` 1
