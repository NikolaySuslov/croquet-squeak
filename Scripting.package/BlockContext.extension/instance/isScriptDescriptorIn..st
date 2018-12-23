*Scripting-Extensions
isScriptDescriptorIn: aScript
	"Convert the receiver into an appropriate ScriptMessageSend"
	| nArgs selector |
	nArgs := self numArgs.
	nArgs = 0 ifTrue:[selector := #evaluate:].
	nArgs = 1 ifTrue:[selector := #evaluate:with:].
	nArgs = 2 ifTrue:[selector := #evaluate:with:with:].
	nArgs = 3 ifTrue:[selector := #evaluate:with:with:with:].
	nArgs = 4 ifTrue:[selector := #evaluate:with:with:with:with:].
	selector ifNil:[^false].
	^aScript selector == selector and:[(aScript arguments at: 1) == self].