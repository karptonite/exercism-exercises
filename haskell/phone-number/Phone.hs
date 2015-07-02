module Phone (areaCode, number, prettyPrint)
where
import Data.Char(isDigit)

number :: String -> String
number xs
  | length' xs == 10 = normNumber xs
  | length' xs == 11 && head xs == '1' = tail $ normNumber xs
  | otherwise = "0000000000"
  where 
    normNumber = filter isDigit
    length' = length . normNumber


areaCode :: String -> String
areaCode = take 3 . number 

prettyPrint :: String -> String
prettyPrint xs = '(' : area ++ ") " ++ co ++ "-" ++ subscriber
  where
    phoneNumber = number xs
    area = areaCode xs 
    (co, subscriber) = splitAt 3 $ drop 3 phoneNumber

