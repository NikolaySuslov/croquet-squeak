debugging
isKindOf: aClass 
	"Answer whether the class, aClass, is a superclass or class of the receiver."
	self proxyDebuggerMessages ifTrue:[^self send: #isKindOf: with: aClass].
	self class == aClass
		ifTrue: [^true]
		ifFalse: [^self class inheritsFrom: aClass].