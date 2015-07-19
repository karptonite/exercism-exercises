module Triangle (TriangleType (..), triangleType)
where
import Data.List (sort)
data TriangleType = Equilateral | Isosceles | Scalene | Illogical deriving (Eq, Show)

triangleType :: Int -> Int -> Int -> TriangleType
triangleType x y z = triangleTypeSorted $ toTuple $ sort [x, y, z]
  where
    toTuple [a, b, c] = (a, b, c)
    triangleTypeSorted :: (Int, Int, Int) -> TriangleType
    triangleTypeSorted (a, b, c)
      | a <= 0 = Illogical
      | (a + b) <= c = Illogical
      | a == b && b == c = Equilateral
      | a == b  || b == c = Isosceles
      | otherwise = Scalene

