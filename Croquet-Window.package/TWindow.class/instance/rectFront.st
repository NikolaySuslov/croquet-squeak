accessing
rectFront

	contentsOn ifFalse:[ 
		^ rectFront. 		
		] ifTrue:[ ^ saveContents.].
	^ rectFront.