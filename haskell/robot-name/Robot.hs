module Robot (mkRobot, robotName, resetName)
where
import System.Random
import Control.Monad (liftM)

data Robot = Robot StdGen 

mkRobot :: IO Robot
mkRobot = liftM Robot newStdGen

robotName :: Robot -> IO String
robotName (Robot gen) =  (++) <$> randomChars 2 gen <*> randomDigits 3 gen
    where
    randomChars :: Int -> StdGen -> IO String
    randomChars x = randomRx x ('A', 'Z')
    randomDigits :: Int -> StdGen -> IO String
    randomDigits x = randomRx x ('0', '9')
    randomRx ::  Int -> (Char, Char) -> StdGen -> IO String
    randomRx num bound gen =  return $ take num $ randomRs bound gen



resetName :: Robot -> IO StdGen
resetName (Robot gen) =newStdGen
