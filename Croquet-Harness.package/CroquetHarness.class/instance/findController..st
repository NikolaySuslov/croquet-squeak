accessing
findController: aBlock
	"Find a controller matching the given block"
	^controllers detect: aBlock ifNone:[nil].