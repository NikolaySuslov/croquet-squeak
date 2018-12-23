painting
fill: evt 
	"Find the area that is the same color as where you clicked. Fill it with 
	the current paint color."
	| box |
	evt isMouseUp
		ifFalse: [^ self].
	palette recentColor: palette getColor.
	"Only fill upon mouseUp"
	"would like to only invalidate the area changed, but can't find out what it is."
	Cursor execute
		showWhile: [
			box := paintingForm
				floodFill: palette getColor
				at: evt cursorPoint - bounds origin.
			self invalidRect: (box translateBy: bounds origin)]