accessing
formatter
	^ formatter ifNil: [formatter := LogFormatter new]