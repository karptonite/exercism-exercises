module ETL(transform)
where
import qualified Data.Map as Map
import Data.List (foldl')
import Data.Char (toLower)

type OldFormat = Map.Map Int [String]
type NewFormat = Map.Map String Int

transform :: OldFormat -> NewFormat
transform = Map.foldlWithKey insertLetters Map.empty 
  where
    insertLetters :: NewFormat -> Int -> [String] -> NewFormat
    insertLetters acc score = foldl' insertLetter acc
      where
        insertLetter :: NewFormat -> String -> NewFormat
        insertLetter acc' l = Map.insert (map toLower l) score acc'
