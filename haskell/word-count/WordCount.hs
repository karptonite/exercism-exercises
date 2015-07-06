module WordCount (wordCount)
where
import Data.List (foldl')
import qualified Data.Map as Map (Map, empty, insertWith)
import Data.Char (toLower, isAlphaNum)

type Word' = String
type WordMap = Map.Map Word' Int

wordCount :: String -> WordMap
wordCount s =  foldl' insertWord Map.empty $ splitWords s
  where
    splitWords :: String -> [Word']
    splitWords = words . map (toLower . puncToSpaces)
      where
        puncToSpaces :: Char -> Char
        puncToSpaces c = if isAlphaNum c then c else ' '
    insertWord :: WordMap -> Word' -> WordMap
    insertWord m w = Map.insertWith (+) w 1 m 
