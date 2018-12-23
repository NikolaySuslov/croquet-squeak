*HedgeHacks-Painter
flipVertically
	"Flip the image along the y axis"
	| rowLen row topIndex botIndex |
	self unhibernate.
	rowLen := bits size // height.
	row := Bitmap new: rowLen.
	topIndex := 1.
	botIndex := bits size - rowLen + 1.
	1 to: height // 2 do: [:i |
		self assert:[topIndex+rowLen <= botIndex].
		row replaceFrom: 1 to: rowLen with: bits startingAt: topIndex.
		bits replaceFrom: topIndex to: topIndex+rowLen-1 with: bits startingAt: botIndex.
		bits replaceFrom: botIndex to: botIndex+rowLen-1 with: row startingAt: 1.
		topIndex := topIndex + rowLen.
		botIndex := botIndex - rowLen.
	].
