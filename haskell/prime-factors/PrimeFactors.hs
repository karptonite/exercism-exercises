module PrimeFactors (primeFactors)
where
import Data.Maybe (fromMaybe)
import Data.List (find)

primeFactors :: Int -> [Int]
primeFactors 1 = []
primeFactors x = n : primeFactors (x `div` n)
  where
    n = nextFactor x

nextFactor :: Int -> Int
nextFactor x = fromMaybe x $ find (\f -> x `mod` f == 0) [2..x]
