accessing
bufferedMessages
	^bufferedMessages ifNil: [bufferedMessages := OrderedCollection new]