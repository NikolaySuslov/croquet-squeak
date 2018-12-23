loader process
startLoaderProcess
	self stopLoaderProcess.
	loaderProcess := self fork: #runLoaderProcess at: Processor userBackgroundPriority.