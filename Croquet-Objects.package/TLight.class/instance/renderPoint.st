render
renderPoint

	" This renders a visual representation of a point light source. This is used to orient the light."

	renderObject := TSphere new.
	renderObject radius: 0.5.
	self addChild: renderObject.

