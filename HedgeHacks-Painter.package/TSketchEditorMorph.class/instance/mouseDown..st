drawing
mouseDown: evt
	"Start a new stroke.  Check if any palette setting have changed.  6/11/97 20:30 tk"
	| cur pfPen myAction |
	self prepareToPaint: evt.
	"verify that we are in a good state"
	pfPen := self paintingFormPen.
	undoBuffer := paintingForm deepCopy.	"know we will draw something"
	pfPen place: (evt cursorPoint - bounds origin).
	myAction := palette action.
	myAction == #paint: ifTrue:[
		palette recentColor: palette getColor].
		"origin point for pickup: rect: ellispe: polygon: line: star:.  Always take it."
	myAction == #pickup: ifTrue: [
		cur := Cursor corner clone.
		cur offset: 0@0  "cur offset abs".
		evt hand showTemporaryCursor: cur].
	myAction == #polygon: ifTrue: [self polyNew: evt].	"a mode lets you drag vertices"
	self mouseMove: evt.