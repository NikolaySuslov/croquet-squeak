accessing
lockRefsDuring: aBlock
	| farRefLock |
	farRefLock := TFarRef allFarRefs asArray.
	farRefLock. "fake usage"
	^super lockRefsDuring: aBlock