events
doPointerDown: event

	| target oTarget |

	oTarget := target := event selection target.
	target ifNil:[
		target := harness avatar replica.
		event selection eventMask: (TFrame eventPointerDown bitOr: TFrame eventBlockRecurse).
	].
 
	(event selection eventMask anyMask: TFrame eventPointerDown) ifTrue:[
		event selection target: nil.
		target futureDo: #doPointerDown: at:0 args:{event}.
	].
	event selection target: oTarget.
