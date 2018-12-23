events
doPointerMove: event

	| target |
	(event selection eventMask anyMask: TFrame eventPointerDown) ifTrue:[
		target := event selection target.
		target ifNotNil:[
			event selection target: nil.
			target futureDo: #doPointerMove: at:0 args:{event}.
			event selection target: target.
			^ true.
		].
	].
	^ false.