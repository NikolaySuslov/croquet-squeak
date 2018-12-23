loader process
stopLoaderProcess
	loaderProcess ifNotNil:[
		loaderProcess terminate.
		loaderProcess := nil.
	].