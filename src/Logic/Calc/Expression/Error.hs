module Logic.Calc.Expression.Error ( Error(..), Result ) where


-- A type for representing every possible error
-- encountered during calculation of an Expression expression.
data Error
    = MissingExpression
    | ExtraneousOperator
    | ExtraneousFunction
    | ExtraneousOperand
    | UnknownExpression
    deriving Enum
type Result = Either Error

instance Show Error where
    show err = case err of
        MissingExpression  -> "No expression given."
        ExtraneousOperator -> "Extraneous operator."
        ExtraneousFunction -> "Extraneous function."
        ExtraneousOperand  -> "Extraneous operand."
        UnknownExpression  -> "Unknown Expression."
