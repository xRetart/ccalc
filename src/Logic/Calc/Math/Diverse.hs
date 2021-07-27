module Logic.Calc.Math.Diverse ( factorial ) where


factorial :: Integral a => a -> a
factorial = product . enumFromTo 1
