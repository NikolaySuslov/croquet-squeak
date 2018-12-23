initialize
initialize
	super initialize.
	self color: (Color white alpha: 0.9).
	self cornerStyle: #rounded.
	self borderStyle: (BorderStyle raised width: 2).
	self layoutPolicy: TableLayout new.
	self hResizing: #shrinkWrap; vResizing: #shrinkWrap.
	frame := TWindowFrameMorph new.
	self on: #mouseDown send: #activateEvent: to: self.
	frame on: #mouseDown send: #startDrag:frame: to: self.
	frame on: #mouseUp send: #stopDrag:frame: to: self.
	frame alphaSlider target: self.
	frame alphaSlider value: self alpha.
	self runScript: #collapseRequest when:{frame collapseButton. #fire}.
	self runScript: #closeRequest when:{frame closeButton. #fire}.
	self runScript: #expandRequest when:{frame expandButton. #fire}.
	self addMorphBack: frame.
	content := (Morph new)
		color: Color transparent;
		layoutPolicy: ProportionalLayout new;
		hResizing: #spaceFill; vResizing: #spaceFill;
		yourself.
	self addMorphBack: content.
	self extent: 400@170.

	self windowColor: Color red.
