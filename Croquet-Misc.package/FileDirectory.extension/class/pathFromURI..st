*Croquet-Misc
pathFromURI: aString
	"
		FileDirectory pathFromURI: 'foo/bar/baz'.
		FileDirectory default pathFromURI: 'foo/bar/baz'.
	"
	^self default pathFromURI: aString