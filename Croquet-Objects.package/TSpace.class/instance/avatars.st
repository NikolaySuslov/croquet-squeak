accessing
avatars
	"Answer an array of avatars in this space. Only searches top-level right now."
	^Array streamContents:[:s|
		self frameChildren do:[:fc| fc isAvatar ifTrue:[s nextPut: fc]]
	].