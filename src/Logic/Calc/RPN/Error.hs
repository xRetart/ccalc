module Logic.Calc.RPN.Error ( Error(..), Result ) where


data Error
    = MissingExpression
    | ExtraneousOperator
    | ExtraneousFunction
    | ExtraneousOperand
    | UnknownExpression
    deriving Enum
instance Show Error where
    show err = case err of MissingExpression  -> "No expression given."
                           ExtraneousOperator -> "Extraneous operator."
                           ExtraneousFunction -> "Extraneous function."
                           ExtraneousOperand  -> "Extraneous operand."
                           UnknownExpression  -> "Unknown Expression."

type Result = Either Error