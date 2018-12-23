converting
asInteger
	| large |
	large := LargePositiveInteger new: 16.
	1 to: 16 do:[:i| large digitAt: i put: (self at: i)].
	^large normalize