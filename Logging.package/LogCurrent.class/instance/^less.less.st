public
<< anObject
"Write an object to the log using its printOn: method"

	self isIgnore ifFalse: [ 
		anObject isString 
			ifTrue: [ stream nextPutAll: anObject ]
			ifFalse: [ anObject logOn: stream ]
	].