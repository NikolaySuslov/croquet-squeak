debugging
printOn: aStream
	"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."

	| title |
	self proxyDebuggerMessages ifTrue:[
		aStream nextPutAll: 'Far:['.
		myValue printOn: aStream. "aStream could be converted to a TFarRef if sent, so don't"
		aStream nextPutAll: ']'.
		^self].
	title := self class name.
	aStream
		nextPutAll: (title first isVowel ifTrue: ['an '] ifFalse: ['a ']);
		nextPutAll: title