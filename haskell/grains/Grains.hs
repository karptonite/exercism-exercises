module Grains (square, total)
where

square :: Int -> Integer
square n = 2^(n-1)

total :: Integer
total = foldl (\acc x -> acc + square x) 0 [1..64]
