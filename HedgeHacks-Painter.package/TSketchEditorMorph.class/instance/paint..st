painting
paint: evt
	"While the mouse is down, lay down paint, but only within window bounds.
	 11/28/96 sw: no longer stop painting when pen strays out of window; once it comes back in, resume painting rather than waiting for a mouse up"

	|  pfPen myBrush lastPoint dirtyRect trail nextPoint |
	pfPen := self paintingFormPen.
	myBrush := palette getNib.
	lastPoint := pfPen location.
	dirtyRect := lastPoint + myBrush offset extent: myBrush extent.
	evt isMouseMove 
		ifTrue:[trail := evt trail copyWith: evt position]
		ifFalse:[trail := Array with: evt position].
	1 to: trail size do:[:i|
		nextPoint := (trail at: i) - bounds origin.
		pfPen goto: nextPoint.
		dirtyRect := dirtyRect merge: (nextPoint + myBrush offset extent: myBrush extent).
		lastPoint := nextPoint.
	].
	self invalidRect: (dirtyRect translateBy: bounds origin).