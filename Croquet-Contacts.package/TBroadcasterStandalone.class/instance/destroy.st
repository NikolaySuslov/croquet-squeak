initialize
destroy

	webserver ifNotNil:[
		webserver destroy.
		webserver := nil
	].
