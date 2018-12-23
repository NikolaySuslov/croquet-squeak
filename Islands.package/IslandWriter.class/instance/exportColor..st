export
exportColor: aColor
	"Export a color"
	dataStream nextPut: CodeColor.
	dataStream nextUInt32Put: aColor pixelValue32.