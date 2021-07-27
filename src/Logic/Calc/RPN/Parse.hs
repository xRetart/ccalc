module Logic.Calc.RPN.Parse ( parse ) where

import Text.Read ( readMaybe )
import Data.Map ( Map, fromList , (!?) )

import Logic.Utils ( maybeToEither )
import Logic.Calc.RPN.Error ( Error(..), Result )
import Logic.Calc.RPN.Structure ( RPN, Token(..) )
import Logic.Calc.Math.Uniform ( factorial )


parse :: [String] -> Result RPN
parse = mapM (\ str -> maybe (parseNum str) Right (tokenMap !? str))
    where
        parseNum :: String -> Result Token
        parseNum = maybeToEither UnknownExpression . (Number <$>) . readMaybe

        tokenMap :: Map String Token
        tokenMap = fromList
            [ ("+", Operator (+))
            , ("-", Operator (-))
            , ("*", Operator (*))
            , ("/", Operator (/))
            , ("^", Operator (**))
            , ("sin", Function sin)
            , ("cos", Function cos)
            , ("tan", Function tan)
            , ("!", RFunction factorial)
            ]
