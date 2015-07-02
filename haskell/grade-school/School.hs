module School (School, add, sorted, grade, empty)
where
import Data.List(groupBy, sortBy)

type StudentName = String
type GradeLevel = Int
type Student = (GradeLevel, StudentName)
type Grade = ( GradeLevel, [StudentName] )
type School = [Student]
type SortedSchool = [Grade]

empty :: School
empty = []

add :: GradeLevel -> StudentName -> School -> School
add g s sch = (g, s) : sch

sorted :: School -> SortedSchool
sorted sc = map collapseGrade $ groupBy (\(x, _) (y, _) -> x == y) $ sortBy compareStudents sc
  where
    collapseGrade :: [Student] -> Grade 
    collapseGrade  = foldr (\(g, s) (_,ss) -> (g, s:ss) ) (0, [])
    compareStudents :: Student -> Student -> Ordering
    compareStudents (g1, s1) (g2, s2) = (g1 `compare` g2) `mappend` (s1 `compare` s2)

grade :: GradeLevel -> School -> [StudentName]
grade g' = foldl (\acc (g, ss) -> if g == g' then ss else acc ) [] . sorted
