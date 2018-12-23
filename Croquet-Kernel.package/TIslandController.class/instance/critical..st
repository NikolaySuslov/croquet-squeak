locking
critical: aBlock
	"Aquire exclusive access to the island for the duration of aBlock"
	^mutex critical: aBlock