public
detailed: anObject
"Write this object and its contents to the log using the ObjectExplorer"

	self isIgnore ifFalse: [ 
		anObject isString 
			ifTrue: [ stream nextPutAll: anObject ]
			ifFalse: [ anObject logDetailedOn: stream ].
		self endEntry.
	].