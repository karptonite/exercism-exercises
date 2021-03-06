module LeapYear (isLeapYear)
where
isLeapYear :: Integer -> Bool
isLeapYear year
  | year `divisibleBy` 400 = True
  | year `divisibleBy` 100 = False
  | year `divisibleBy` 4   = True
  | otherwise              = False
  where divisibleBy x y = x `mod` y == 0
