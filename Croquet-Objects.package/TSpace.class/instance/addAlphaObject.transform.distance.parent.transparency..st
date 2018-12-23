accessing
addAlphaObject: anObject transform: aTransform distance: aDistance parent: aParent transparency: trans
	alphaObjects class == Array ifTrue:[^self].
	alphaObjects add: (TRenderAlpha object: anObject transform: aTransform distance: aDistance parent: aParent transparency: trans).