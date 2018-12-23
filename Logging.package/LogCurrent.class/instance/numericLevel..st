accessing
numericLevel: anInteger
	level := Levels keyAtValue: anInteger ifAbsent: [^ self]