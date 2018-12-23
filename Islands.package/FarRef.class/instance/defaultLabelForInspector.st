debugging
defaultLabelForInspector
	"Answer the default label to be used for an Inspector window on the receiver."
	self proxyDebuggerMessages ifFalse:[^self class name].
	^'Far:[',(self send: #defaultLabelForInspector),']'