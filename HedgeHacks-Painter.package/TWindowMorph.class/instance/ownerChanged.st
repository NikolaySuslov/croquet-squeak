geometry
ownerChanged
	"back stop so we can adjust activity state"
	owner ifNotNil:[
		owner firstSubmorph == self 
			ifTrue:[self activate]
			ifFalse:[self passivate].
	].
	^super ownerChanged