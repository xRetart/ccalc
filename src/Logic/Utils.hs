module Logic.Utils ( maybeToEither ) where


-- Convert a `Maybe` to an `Either` given a fallback value.
maybeToEither :: a -> Maybe b -> Either a b
maybeToEither = flip maybe Right . Left
