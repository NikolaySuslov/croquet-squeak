compiled methods
testCompiledMethodsAreNew
	"ensure all compiled methods have their MethodProperties"
	CompiledMethod allInstancesDo:[:cm|
		self assert: (cm properties isKindOf: MethodProperties).
	].