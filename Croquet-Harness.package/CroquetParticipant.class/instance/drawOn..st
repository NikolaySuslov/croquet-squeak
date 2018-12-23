drawing
drawOn: aCanvas

	(harness == nil or:[harness doRender not]) ifTrue:["still waiting for connection"
		super drawOn: aCanvas.
		^aCanvas drawString: 'Waiting for connection...' at: bounds origin.
	].
	lastBounds ~= self bounds ifTrue:[
		lastBounds := self bounds.
		harness bounds: self bounds.
	].
	harness render.
	Display addExtraRegion: bounds for: self.