module Sublist (Sublist(..), sublist)
where 
data Sublist = Equal | Sublist | Superlist | Unequal deriving (Eq, Show)
sublist :: (Eq a) => [a] -> [a] -> Sublist
sublist xs ys
  | xs == ys       = Equal
  | sublist' xs ys = Sublist
  | sublist' ys xs = Superlist
  | otherwise      = Unequal


sublist' :: (Eq a) => [a] -> [a] -> Bool
sublist' [] _ = True
sublist' _ [] = False
sublist' allx ally@(_:ys)
  | atSublist allx ally = True
  | otherwise = sublist' allx ys 

atSublist :: (Eq a) => [a] -> [a] -> Bool
atSublist [] _ = True
atSublist _ [] = False
atSublist (x:xs) (y:ys)
  | x == y    = atSublist xs ys
  | otherwise = False

