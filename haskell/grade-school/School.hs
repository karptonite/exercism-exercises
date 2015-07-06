module School (School, add, sorted, grade, empty)
where
import Data.List(insert)
import qualified Data.Map as Map

type Student = String
type GradeLevel = Int
type Grade = ( GradeLevel, [Student] )
newtype School = School (Map.Map GradeLevel [Student])

empty :: School
empty = School Map.empty

add :: GradeLevel -> Student -> School -> School
add gradeLevel student (School school) = 
  School $ Map.insertWith insertStudent gradeLevel [student] school
  where insertStudent :: [Student] -> [Student] -> [Student]
        insertStudent (newStudent:_) = insert newStudent

sorted :: School -> [Grade]
sorted (School school) = Map.toList school

grade :: GradeLevel -> School -> [Student]
grade gradeLevel (School school) =  Map.findWithDefault [] gradeLevel school
