parse
makeNumberArray: string

	| start farray parseStream |
	parseStream := ReadStream on: string.	
	farray := OrderedCollection new.
	start := 0.

	[start := string indexOfAnyOf: NumberSet startingAt: start+1 ifAbsent: [0].
		start = 0] whileFalse:[
			parseStream position: start-1.
			farray add: (Number readFrom: parseStream).
			start := parseStream position+1.
		].
	^ farray.