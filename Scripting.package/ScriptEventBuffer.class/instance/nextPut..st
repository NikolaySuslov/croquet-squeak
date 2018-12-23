streaming
nextPut: anEvent
	size = 0 ifTrue:[
		firstEvent := lastEvent := anEvent.
	] ifFalse:[
		lastEvent priorEvent: anEvent. "READ THE CLASS COMMENT!!!"
		lastEvent := anEvent.
	].
	size := size + 1.
