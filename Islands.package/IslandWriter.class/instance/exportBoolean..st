export
exportBoolean: aBool
	dataStream nextPut: (aBool ifTrue:[CodeTrue] ifFalse:[CodeFalse]).