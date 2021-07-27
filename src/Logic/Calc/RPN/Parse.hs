module Logic.Calc.RPN.Parse ( parse ) where

import Text.Read ( readMaybe )
import Data.Maybe ( fromMaybe )
import Control.Monad ( MonadPlus(mplus), liftM2 )
import Data.Map ( Map, fromList , (!?) )

import Logic.Calc.RPN.Structure ( RPN, Token(..) )
import Logic.Calc.Math.Uniform ( factorial )


parse :: [String] -> Maybe RPN
parse = mapM $ liftM2 mplus parseNum (tokenMap !?)
    where
        parseNum :: String -> Maybe Token
        parseNum = (Number <$>) . readMaybe

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
