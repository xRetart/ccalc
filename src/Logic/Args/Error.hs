module Logic.Args.Error ( Error(..), Result ) where


data Error
    = TooLittle
    | TooMany
    deriving ( Enum, Bounded )
type Result = Either Error

instance Show Error where
    show err = case err of
        TooLittle -> "Not enough arguments."
        TooMany   -> "Too many arguments."
