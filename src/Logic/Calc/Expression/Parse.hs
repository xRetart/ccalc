module Logic.Calc.Expression.Parse ( parse ) where

import Text.Read ( readMaybe )
import Data.Maybe ( fromMaybe )
import Control.Monad ( MonadPlus(mplus), liftM2 )
import Data.Map ( Map, fromList , (!?) )

import Logic.Calc.Expression.Structure ( Expression, Lexeme(..) )
import Logic.Calc.Math.Uniform ( factorial )


parse :: [String] -> Maybe Expression
parse = mapM $ liftM2 mplus parseNum (tokenMap !?)
    where
        parseNum :: String -> Maybe Lexeme
        parseNum = (Literal <$>) . readMaybe

        tokenMap :: Map String Lexeme
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
