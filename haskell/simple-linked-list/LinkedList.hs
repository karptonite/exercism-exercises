module LinkedList (nil, isNil, new, datum, next, toList, fromList, reverseLinkedList)
where
  
data List a = Empty | Elem a (List a)

nil :: List a
nil = Empty

isNil :: List a -> Bool
isNil _ = True

new :: a -> List a -> List a
new    = Elem 

datum :: List a -> a
datum (Elem x _) = x

next :: List a -> List a
next (Elem _ l) = l

toList :: List a -> [a]
toList Empty = []
toList (Elem x l) = x : toList l

fromList :: [a] -> List a
fromList = foldr Elem Empty

reverseLinkedList :: List a -> List a
reverseLinkedList Empty = Empty
reverseLinkedList (Elem x Empty) = Elem x Empty
reverseLinkedList (Elem x l) = new (datum (reverseLinkedList l)) $ reverseLinkedList $ new x $ reverseLinkedList $ next $ reverseLinkedList l


