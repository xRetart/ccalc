module Logic.Utils ( maybeToEither ) where


-- Convert a `Maybe` to an `Either` with an alternative value.
-- This is not defined in the standard for some reason.
maybeToEither :: a -> Maybe b -> Either a b
maybeToEither = flip maybe Right . Left
