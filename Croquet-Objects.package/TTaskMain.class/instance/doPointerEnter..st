events
doPointerEnter: event

	| target |
	(event selection eventMask anyMask: TFrame eventPointerOver) ifTrue:[
		target := event selection target.
		target ifNotNil:[
			event selection target: nil.
			target futureDo: #doPointerEnter: at:0 args:{event}.
			event selection target: target.
			^ true.
		].
	].
	^ false.