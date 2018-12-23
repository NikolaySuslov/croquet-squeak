export
exportFloat: aFloat
	"Export a literal"
	dataStream nextPut: CodeFloat.
	dataStream nextUInt32Put: (aFloat basicAt: 1).
	dataStream nextUInt32Put: (aFloat basicAt: 2).