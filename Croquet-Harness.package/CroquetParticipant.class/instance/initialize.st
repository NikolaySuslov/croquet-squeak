initialization
initialize

	super initialize.
	self clipSubmorphs: true.
	self color: (Color
				r: 1.0
				g: 0.0
				b: 0.0).
	self extent: 640@480.
	self setProperty: #suppressStepping toValue: true.