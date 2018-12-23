export
exportArray: array
	"Export an array"
	dataStream nextPut: CodeArray.
	dataStream nextUInt32Put: array size.
	array do:[:each| self export: each].