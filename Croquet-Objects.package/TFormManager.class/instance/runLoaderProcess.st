loader process
runLoaderProcess
	| tff |
	[true] whileTrue:[
		loaderSema wait.
		mutex critical:[tff := sortedFindList first].
		self loadNextTFF: tff.
	].