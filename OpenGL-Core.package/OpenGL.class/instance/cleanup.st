initialize
cleanup
	"Clean up any unused display list"
	| any listRange |
	any := false.
	glListRegistry associationsDo:[:assoc|
		assoc key == nil ifTrue:[
			listRange := assoc value.
			self glDeleteLists: listRange first with: listRange last.
			any := true].
	].
	any ifTrue:[glListRegistry finalizeValues].
