module DNA (count, nucleotideCounts)
where
import qualified Data.Map.Strict as Map
import Data.List (foldl')


type ResidueMap = Map.Map Char Int

residues :: String
residues = "ATGC"

isResidue :: Char -> Bool
isResidue = (`elem` residues)

checkResidue :: Char -> Bool
checkResidue n
  | isResidue n = True
  | otherwise = error $ invalidResidueError n

invalidResidueError :: Char -> String
invalidResidueError n = "invalid nucleotide " ++ show n

count :: Char -> String -> Int
count n = checkResidue n `seq` Map.findWithDefault 0 n . nucleotideCounts

nucleotideCounts :: String -> ResidueMap
nucleotideCounts =  foldl' insertResidue emptyMap 
  where
    insertResidue :: ResidueMap -> Char -> ResidueMap
    insertResidue acc res = checkResidue res `seq` Map.insertWith (+) res 1 acc 
    emptyMap = foldl' (\acc res -> Map.insert res 0 acc) Map.empty residues
