accessing
isKindOf: aClass 
	"--- needed for debugging ---"
	self class == aClass
		ifTrue: [^true]
		ifFalse: [^self class inheritsFrom: aClass]