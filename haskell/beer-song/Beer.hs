module Beer (verse, sing)
where
import Data.List (intercalate)
import Data.Char (toUpper)

verse :: Int -> String
verse x  = line1 ++ line2
  where
    line1 = capitalize $ inventory x ++ ", " ++ pluralizeBeer x ++ ".\n"
    line2 = pluralizeConsume x ++ inventory (x - 1) ++ ".\n"

    inventory (-1) = inventory 99
    inventory n = pluralizeBeer n ++ " on the wall"

    capitalize (l:ls) = toUpper l : ls

    pluralizeConsume 0 = "Go to the store and buy some more, "
    pluralizeConsume n = "Take " ++ pluralizeDrink n ++ " down and pass it around, "

    pluralizeDrink 1 = "it"
    pluralizeDrink _ = "one"

    pluralizeBeer 0 = "no more bottles of beer"
    pluralizeBeer 1 = "1 bottle of beer"
    pluralizeBeer n = show n ++ " bottles of beer"

sing :: Int -> Int -> String
sing start finish = intercalate "\n" [verse x| x <- [start, start - 1 .. finish]] ++ "\n"
