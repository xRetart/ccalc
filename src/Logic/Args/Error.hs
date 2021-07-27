module Logic.Args.Error ( Error(..), Result ) where


data Error
    = TooLittle
    | TooMany
    deriving ( Enum, Bounded )
type Result = Either Error

instance Show Error where
    show TooLittle = "Not enough arguments."
    show TooMany = "Too many arguments."
