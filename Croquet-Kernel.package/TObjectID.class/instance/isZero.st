testing
isZero
	1 to: self size do:[:i| (self at: i) = 0 ifFalse:[^false]].
	^true