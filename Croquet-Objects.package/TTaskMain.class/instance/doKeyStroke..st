events
doKeyStroke: event

	| target |
	(event selection eventMask anyMask: TFrame eventKeyboard) ifTrue:[
		target := event selection target.
		target ifNotNil:[
			event selection target: nil.
			target futureDo: #doKeyStroke: at:0 args:{event}.
			event selection target: target.
			^ true.
		].
	].
	^ false.