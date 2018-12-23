render
renderDirectional

	| part |

	" This renders a visual representation of a directional light. This is used to orient the light."

	renderObject := TGroup new.

	part := TCylinder new.
	part topRadius: 0.0.
	part baseRadius: 0.5.
	part height: 0.5.	
	renderObject addChild: part.

	part := TCylinder new.
	part baseRadius: 0.25.
	part topRadius: 0.25.
	part height: 0.5.
	part translationX: 0.0 y: -0.5 z:0.0.
	renderObject addChild: part.

	self addChild: renderObject.