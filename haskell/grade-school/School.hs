module School (School, add, sorted, grade, empty)
where
import Data.List(insert)
import qualified Data.Map as Map

type StudentName = String
type GradeLevel = Int
type Grade = ( GradeLevel, [StudentName] )
type School = Map.Map GradeLevel [StudentName]

empty :: School
empty = Map.empty

add :: GradeLevel -> StudentName -> School -> School
add g s = Map.insertWith (\(a:_) b -> insert a b) g [s]

sorted :: School -> [Grade]
sorted = Map.toList

grade :: GradeLevel -> School -> [StudentName]
grade g sch = extractList $ Map.lookup g sch
  where 
    extractList :: Maybe [a] -> [a]
    extractList Nothing = []
    extractList (Just xs) = xs
