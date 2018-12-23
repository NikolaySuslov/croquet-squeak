plugins
testSurfacePlugin
	Smalltalk platformName = 'Win32'
		ifTrue:[^self internalPlugin: 'SurfacePlugin'].
	self eitherPlugin: 'SurfacePlugin'.