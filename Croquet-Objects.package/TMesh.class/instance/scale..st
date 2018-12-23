accessing
scale: scale
	super scale: scale.
	scale isNumber ifTrue:[
		vertexBuffer *= scale.
		self scaleBounds: scale.
	] ifFalse:[
		1 to: vertexBuffer size do:[:i | vertexBuffer at: i put:((vertexBuffer at:i)*scale).].
		self boundsChanged.
	].