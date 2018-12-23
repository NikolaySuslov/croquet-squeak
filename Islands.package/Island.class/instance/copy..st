utilities
copy: farRef
	"Bring a copy of the value of the ref here, completely resolved to be in the this Island."

	"Must be performed with me as the current island!"
	^ farRef isFarRef 
		ifTrue: [farRef copyToCurrentIsland]
		ifFalse: [farRef]
