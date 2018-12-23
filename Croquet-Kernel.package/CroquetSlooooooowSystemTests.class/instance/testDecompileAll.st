tests
testDecompileAll
	"Make sure we can decompile all methods"
	CompiledMethod allInstances do:[:cm| 
		self shouldnt:[cm methodNode] raise: Error.
	].