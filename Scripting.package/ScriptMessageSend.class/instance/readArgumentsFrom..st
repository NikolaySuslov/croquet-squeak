factory
readArgumentsFrom: anArray
	arguments := Array new: anArray size - 1.
	2 to: anArray size do:[:idx|
		arguments at: idx-1 put: (anArray at: idx).
	].