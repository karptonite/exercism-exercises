module Meetup (Weekday(..), Schedule(..), meetupDay)
where
import Data.Time.Calendar
import Data.Time.Calendar.WeekDate

data Weekday = Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday deriving (Enum, Eq)
data Schedule = First | Second | Third | Fourth | Teenth | Last deriving (Enum, Eq)
type Year = Integer
type Month = Int

meetupDay :: Schedule -> Weekday -> Year -> Month -> Day
meetupDay schedule weekday year month
  | schedule == Last = last daysForWeekday
  | schedule == Teenth = head $ filter isTeenth daysForWeekday
  | otherwise = daysForWeekday !! scheduleToIndex schedule
  where
    isTeenth :: Day -> Bool
    isTeenth day =
      let (_, _, dayOfMonth) = toGregorian day
      in dayOfMonth `elem` [13..19]
    scheduleToIndex :: Schedule -> Int
    scheduleToIndex = fromEnum
    daysForWeekday = weekdaysInMonth year month weekday

weekdaysInMonth :: Year -> Month -> Weekday -> [Day]
weekdaysInMonth year month weekday = filter isWeekDay $ allDaysInMonth year month
  where
    isWeekDay :: Day -> Bool
    isWeekDay day = 
      let (_, _, intDay) = toWeekDate day
      in toEnum (intDay `mod` 7) == weekday

allDaysInMonth :: Year -> Month -> [Day]
allDaysInMonth year month = [firstDayOfMonth .. lastDayOfMonth]
  where
    firstDayOfMonth = fromGregorian year month 1
    lastDayOfMonth = addDays (toInteger (gregorianMonthLength year month) - 1) firstDayOfMonth

