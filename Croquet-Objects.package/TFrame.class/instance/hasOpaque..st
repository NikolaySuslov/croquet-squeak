accessing
hasOpaque: ogl

	^ self hasOpaque and:[ogl transparency = 1.0].