accessing
textureMode
	"OBSOLETE. Remove this."
	^texture ifNil:[GLModulate] ifNotNil:[texture textureMode].