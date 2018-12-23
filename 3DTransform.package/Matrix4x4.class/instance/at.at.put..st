accessing
at: i at: j put: aValue
	^ self at: ((i - 1) * 4 + j) put: aValue.
