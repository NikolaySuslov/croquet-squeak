compiled methods
testCompiledMethodsHaveSelector
	"ensure all compiled methods have their selector"
	CompiledMethod allInstancesDo:[:cm|
		self assert: (cm selector notNil).
	].