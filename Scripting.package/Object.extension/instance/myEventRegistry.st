*Scripting-Extensions
myEventRegistry
	^Smalltalk at: #TestingEventMap  ifAbsentPut:[WeakIdentityKeyDictionary new].