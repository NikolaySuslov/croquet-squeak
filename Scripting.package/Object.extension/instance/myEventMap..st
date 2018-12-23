*Scripting-Extensions
myEventMap: anEventMap
	anEventMap 
		ifNil:[self myEventRegistry removeKey: self ifAbsent:[]]
		ifNotNil:[self myEventRegistry at: self put: anEventMap].