module RPN.Make ( make ) where

import Control.Arrow ( (>>>) )
import Text.Read ( readMaybe )
import Data.Functor ( (<&>) )
import Data.Function ( (&) ) 
import Data.Maybe ( fromMaybe ) 
import Data.Map ( Map
                , fromList
                , (!?)
                )

import RPN.Error ( Error(..), Result )
import Math.Uniform ( factorial )
import RPN.Structure ( RPN
                     , Token(..)
                     , Value
                     )



-- Convert a `maybe` to an `either`. (Not defined in the standard for some reason.)
maybeToEither :: a -> Maybe b -> Either a b
maybeToEither = flip maybe Right . Left

make :: [String] -> Result RPN
make = mapM (\str -> fromMaybe (parseNum str) (str & (tokenMap !?) <&> Right))
    where parseNum :: String -> Result Token
          parseNum = readMaybe >>> (<&> Number) >>> maybeToEither UnknownExpression

          tokenMap :: Map String Token
          tokenMap = fromList [ ("+", Operator (+))
                              , ("-", Operator (-))
                              , ("*", Operator (*))
                              , ("/", Operator (/))
                              , ("^", Operator (**))
                              , ("sin", Function sin)
                              , ("cos", Function cos)
                              , ("tan", Function tan)
                              , ("!", RFunction factorial)
                              ]
