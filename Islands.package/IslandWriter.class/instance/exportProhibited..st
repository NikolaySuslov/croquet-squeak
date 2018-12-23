export
exportProhibited: anObject
	self error: anObject class name,': Export problem (proceed to ignore)'.
	^self export: nil