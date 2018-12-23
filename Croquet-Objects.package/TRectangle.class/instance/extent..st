accessing
extent: ext

	aspectFixed ifTrue:[
	 (extent x/extent y)abs >= 1 ifTrue:[
			extent := (ext x) @ (ext x * aspect).] 
		ifFalse:[
			extent := ext y/aspect @ ext y.].
		]
	ifFalse: [	extent := ext.].
	self boundsChanged.

