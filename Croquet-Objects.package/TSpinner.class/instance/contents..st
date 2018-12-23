accessing
contents: cnt

	contents ifNotNil:[
		self removeChild: contents.].
	contents := cnt.
	matNorm ifNotNil:[ contents material: matNorm. ].
	self addChild: contents.