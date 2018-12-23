accessing
hasAlpha: ogl

	^ self hasAlpha or:[ogl transparency < 1.0].