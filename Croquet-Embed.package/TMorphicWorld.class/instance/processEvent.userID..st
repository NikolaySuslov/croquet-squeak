events
processEvent: evtBuf userID: id
	| hand priorHand |
	true ifTrue:[
		hand := world firstHand.
	] ifFalse:[
		hand := hands at: id ifAbsentPut:[
			hand := THandMorph new.
			world addHand: hand.
			hand].
	].
	priorHand := ActiveHand.
	ActiveHand := hand.
	hand processEventBuffer: evtBuf.
	ActiveHand  := priorHand.
	self update.