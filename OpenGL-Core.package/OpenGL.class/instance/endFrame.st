initialize
endFrame
	textureManager endFrame.
	self cleanup.
	matrixStack size > 0 ifTrue:[self error:'Unbalanced OGL matrix stack'].
	forceHilite ifNotNil: [self error: 'Unbalanced forceHilite.'].
