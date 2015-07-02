module Strain (keep, discard)
where
import Data.List (sort)

keep :: (a -> Bool) -> [a] -> [a]
keep predicate xs = [ x | x <- xs, predicate x ]

discard :: (a -> Bool) -> [a] -> [a]
discard predicate xs = [ x | x <- xs, not $ predicate x ]
