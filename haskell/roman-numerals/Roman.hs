module Roman (numerals)
where
import qualified Data.Map as Map

numerals :: Int -> String
numerals = concat . convertToRoman []

convertToRoman :: [String] -> Int -> [String]
convertToRoman rs 0 = rs
convertToRoman rs n = convertToRoman (rs ++ [r]) $ n - num
  where
    (num, r) = nextRoman n

nextRoman :: Int -> (Int, String)
nextRoman x = Map.findMax $ Map.filterWithKey (\k _ -> x >= k) romanMap
  where 
    romanMap = Map.fromList [
      (1000, "M"),
      (900, "CM"),
      (500, "D"),
      (400, "CD"),
      (100, "C"),
      (90, "XC"),
      (50, "L"),
      (40, "XL"),
      (10, "X"),
      (9, "IX"),
      (5, "V"),
      (4, "IV"),
      (1, "I") ]
