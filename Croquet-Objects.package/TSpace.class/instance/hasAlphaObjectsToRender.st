render
hasAlphaObjectsToRender
	^(alphaObjects size ~= 0 or: [self forceAlpha])