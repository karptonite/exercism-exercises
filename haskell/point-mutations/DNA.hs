module DNA (hammingDistance)
where

hammingDistance :: String -> String -> Int
hammingDistance [] [] = 0
hammingDistance (x:xs) (y:ys) 
  | x == y = 0 + hammingDistance xs ys
  | otherwise = 1 + hammingDistance xs ys
