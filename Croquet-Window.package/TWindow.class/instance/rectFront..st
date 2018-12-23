accessing
rectFront: rf

	contentsOn ifFalse:[ 
		rectFront := rf. 		
		rectFront extent: windowFrame extent asPoint.
		self extent: rectFront extent asPoint.
		] ifTrue:[ saveContents := rf.].
	rf translation: (rf translation + (Vector3 x:0 y:0 z:windowFrame radius)).

