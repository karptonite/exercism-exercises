module Bob (responseFor)
where
import Data.Char

responseFor :: String -> String
responseFor statement
  | all isSpace statement = "Fine. Be that way!"
  | all ( not . isLower ) statement && any isUpper statement = "Whoa, chill out!"
  | last statement == '?' = "Sure."
  | otherwise = "Whatever."
