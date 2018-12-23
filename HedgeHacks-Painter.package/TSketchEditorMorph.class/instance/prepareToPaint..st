painting
prepareToPaint: evt
	"Figure out what the current brush, fill, etc is.  Return an action to take every mouseMove.  Set up instance variable and pens.  Prep for normal painting is inlined here.  tk 6/14/97 21:11"

	| specialMode pfPen cColor cNib myBrush |
	paintingForm ifNil:[
		paintingForm := Form extent: bounds extent depth: 32.
	].
	"Install the brush, color, (replace mode), and cursor."
	specialMode := palette action.
 	cColor  := palette getColor.
	cNib := palette getNib.
	self brush: (myBrush := cNib).
	self paintingFormPen: (pfPen := Pen newOnForm: paintingForm).
	formCanvas := paintingForm getCanvas.	"remember to change when undo"
	formCanvas := formCanvas
		copyOrigin: self topLeft negated
		clipRect: (0@0 extent: bounds extent).

	specialMode == #paint: ifTrue: [
		"get it to one bit depth.  For speed, instead of going through a colorMap every time ."
		self brush: (myBrush := Form extent: myBrush extent depth: 1).
		myBrush offset: (0@0) - (myBrush extent // 2).
		cNib displayOn: myBrush at: (0@0 - cNib offset).

		pfPen sourceForm: myBrush.
		pfPen combinationRule: Form paint.
		pfPen color: cColor.
		cColor isTransparent ifTrue: [
			pfPen combinationRule: Form erase1bitShape.
			pfPen color: Color black].
		^ #paint:].

	specialMode == #erase: ifTrue: [
		self erasePrep: evt.
		^ #erase:].

	(self respondsTo: specialMode) 
		ifTrue: [^ specialMode]	"fill: areaFill: pickup: (in mouseUp:) 
				rect: ellipse: line: polygon: star:"
		ifFalse: ["Don't recognise the command"
			palette setAction: #paint: evt: evt.	"set it to Paint"
			^ self prepareToPaint: evt].