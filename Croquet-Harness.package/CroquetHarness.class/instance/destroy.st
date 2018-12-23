initialize
destroy

	"embeddedApps do:[:app| app destroy]."
	ogl ifNotNil:[ogl destroy].
	ogl := nil.
	controllers ifNotNil:[
		controllers do:[:each| each destroy. ].
	].
	controllers := nil.
	contactPoint ifNotNil:[contactPoint destroy].
	dispatcher ifNotNil:[dispatcher destroy].