module Anagram (anagramsFor)
where
import Data.List (sort)
import Data.Char (toLower)

anagramsFor :: String -> [String] -> [String]

anagramsFor source xs = [ match 
  | match <- xs
    , stringToLower match /= lowerSource
    , sortString match    == sortedSource
  ]
  where
    stringToLower = map toLower
    sortString    = sort . stringToLower
    lowerSource   = stringToLower source
    sortedSource  = sortString source
