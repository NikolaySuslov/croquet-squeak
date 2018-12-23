render
render: space


	self hasAlpha ifFalse:[
		pColor
			ifNil:[self doRenderMonochrome: space]
			ifNotNil:[self doRenderColor: space]
		].
	
