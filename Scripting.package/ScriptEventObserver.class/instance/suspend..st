initialize-release
suspend: aHandler
	aHandler ifNotNil:[aHandler suspend].
	suspended := aHandler.