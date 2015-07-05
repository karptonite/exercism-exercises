module ListOps
  ( length
  , reverse
  , map
  , filter
  , foldr
  , foldl'
  , (++)
  , concat
  ) where

import Prelude hiding
  ( length, reverse, map, filter, foldr, (++), concat )

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' _ acc [] = acc
foldl' f acc (x:xs) = f acc x `seq` foldl' f (f acc x) xs

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr _ acc [] = acc
foldr f acc (x:xs) = f x (foldr f acc xs)

length :: [a] -> Int
length [] = 0
length (_:xs) = 1 + length xs

reverse :: [a] -> [a]
--I'd use a fold here, but we aren't supposed to use existing functions
reverse  = reverse' []
  where
    reverse' :: [a] -> [a] -> [a]
    reverse' acc [] = acc
    reverse' acc (x:xs) = reverse' (x:acc) xs


map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x:xs) = f x : map f xs

filter :: (a -> Bool) -> [a] -> [a]
filter f xs = filter' [] f $ reverse xs
  where
    filter' :: [a] -> (a -> Bool) -> [a] -> [a]
    filter' acc _ [] = acc
    filter' acc f' (x:xs') = if f' x then filter' (x:acc) f' xs' else filter' acc f' xs'

(++) :: [a] -> [a] -> [a]
[] ++ ys = ys
(x:xs) ++ ys = x : (xs ++ ys)

concat :: [[a]] -> [a]
concat [] = []
concat (x:xs) = x ++ concat xs
