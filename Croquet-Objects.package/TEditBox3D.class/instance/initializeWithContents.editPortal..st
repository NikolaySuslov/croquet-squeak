initialize
initializeWithContents: conts editPortal: ep

	contents := conts.
	ep ifNotNil:[
		editPortal := ep.
		editPortal selection: self.
		ghostFrame := editPortal ghost.
	].
	self initializeWithContents: conts.
