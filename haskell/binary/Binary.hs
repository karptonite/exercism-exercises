module Binary (toDecimal)
where

toDecimal :: String -> Int
toDecimal ('0':ds) = toDecimal ds
toDecimal ('1':ds) = 2 ^ length ds + toDecimal ds
toDecimal _ = 0

