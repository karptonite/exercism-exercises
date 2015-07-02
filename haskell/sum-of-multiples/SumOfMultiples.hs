module SumOfMultiples (sumOfMultiples, sumOfMultiplesDefault)
where
sumOfMultiplesDefault = sumOfMultiples [3,5]
sumOfMultiplesDefault :: Int -> Int

sumOfMultiples :: [Int] -> Int -> Int
sumOfMultiples mult z = sum [x | x <- [1 .. (z - 1)], any (\y -> x `mod` y == 0) mult]
