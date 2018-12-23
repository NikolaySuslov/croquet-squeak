initialize-release
resumeSuspending: aHandler
	flags := 0.
	aHandler ifNotNil:[aHandler suspend].
	suspended := aHandler.