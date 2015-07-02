module SpaceAge (Planet (..), ageOn)
where
data Planet = Mercury | Venus | Earth | Mars | Jupiter | Saturn | Uranus | Neptune deriving (Eq)

ageOn :: Planet -> Float -> Float
ageOn planet = ( / 31557600 ) . ( / earthYears planet )

earthYears :: Planet -> Float
earthYears p = 
  case p of
   Mercury -> 0.2408467
   Earth   -> 1
   Venus   -> 0.61519726
   Mars    -> 1.8808158
   Jupiter -> 11.862615
   Saturn  -> 29.447498
   Uranus  -> 84.016846
   Neptune -> 164.79132
