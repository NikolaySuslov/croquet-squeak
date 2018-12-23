tests
testRetrieveAllSources
	"Make sure we can retrieve the source code of all methods"
	CompiledMethod allInstances do:[:cm| 
		self shouldnt:[cm getSourceFromFile] raise: Error.
	].