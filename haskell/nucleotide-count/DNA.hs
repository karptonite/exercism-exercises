module DNA (count, nucleotideCounts)
where
import qualified Data.Map as Map

residues :: String
residues = "ATGC"

isResidue :: Char -> Bool
isResidue = (`elem` residues)

findInvalidResidue :: String -> Char
findInvalidResidue = foldl1( \acc x -> if not $ isResidue x then x else acc ) 

invalidResidueError :: String -> String
invalidResidueError xs = "invalid nucleotide " ++ show (findInvalidResidue xs)

count :: Char -> String -> Int
count n xs
  | isResidue n && all isResidue xs = foldl (\acc x -> if x == n then acc + 1 else acc) 0 xs
  | not $ isResidue n = error $ "invalid nucleotide " ++ show n
  | otherwise = error $ invalidResidueError xs

nucleotideCounts :: String -> Map.Map Char Int 
nucleotideCounts xs
  | all isResidue xs = Map.fromList $ foldl (\res -> (res, count res xs)) xs
  | otherwise = error $ invalidResidueError xs

characterCounts xs = Map.fromlist $ map (\character -> (character, ))



