compiled methods
testCompiledMethodsHaveMethodClass
	"ensure all compiled methods have their methodClass"
	CompiledMethod allInstancesDo:[:cm|
		self assert: (cm methodClass notNil).
	].