private
startUpFrom: firstObj to: lastObj
	"Send startUp messages to all objects"
	| obj next count |
	count := 0.
	(Delay forMilliseconds: 1000) wait .
	obj := firstObj shallowCopy.
	"Note: This order has been carefully chosen so that even if the object #becomes: itself into something different it will work. This is needed for example by MethodDictionary."
	[next := obj nextObject.
	count := count + 1.
	obj startUpInIslandReader: self.
	next == lastObj] whileFalse:[obj := next].
	^count