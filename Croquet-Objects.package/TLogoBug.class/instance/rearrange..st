initialize
rearrange: ogl

	| cornerVector width |
	
	cornerVector := ogl camera cornerVector.
	width := cornerVector x/2.
	self extent:width@width.
	self translation: cornerVector-(width/1.8@(width/2.8) @0).
