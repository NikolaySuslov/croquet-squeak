update
processEvents
	| userID evtBuf hand priorHand type |
	[evtBuf := eventQueue nextOrNil.
	evtBuf == nil] whileFalse:[
		type := evtBuf at: 1.
		type == #mouse ifTrue:[evtBuf at: 1 put: 1].
		type == #keyboard ifTrue:[evtBuf at: 1 put: 2].
		userID := evtBuf at: 2.
		evtBuf at: 2 put: Time millisecondClockValue.
true ifTrue:[
		hand := world firstHand.
] ifFalse:[
		hand := hands at: userID ifAbsentPut:[
			hand := THandMorph new.
			world addHand: hand.
			hand].
].
		priorHand := ActiveHand.
		ActiveHand := hand.
			[hand processEventBuffer: evtBuf] 
				on: RequestProjectOwner do:[:ex| ex resume: self].
		ActiveHand  := priorHand.
	].