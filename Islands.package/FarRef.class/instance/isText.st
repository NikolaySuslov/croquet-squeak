debugging
isText
	self proxyDebuggerMessages ifFalse:[^false].
	^self send: #isText