module LinkedList (nil, isNil, new)
where
  
data List = Alist

nil = Alist

isNil :: List -> Bool
isNil _ = True

new :: a -> List -> List
new _  _ = nil
