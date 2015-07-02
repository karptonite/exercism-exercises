module Accumulate (accumulate)
where
accumulate :: (a -> b) -> [a] -> [b]
accumulate _ [] = []
-- When I included the line below, I got an error about making accumulate lazier. I'm not sure why
-- accumulate f [x] = [f x]
accumulate f (x:xs) = f x : accumulate f xs

-- version 1 was:
-- accumulate f xs = [f x | x <- xs]
