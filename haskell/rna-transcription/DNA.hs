module DNA (toRNA)
where
toRNA :: String -> String
toRNA = map residueToRNA
  where residueToRNA x = case x of
         'A' -> 'U'
         'G' -> 'C'
         'C' -> 'G'
         'T' -> 'A'
         x   -> error "Invalid residue"

