events
passEvent: anEvent type: evtType
	| pt buffer |
	passEvents == false ifTrue: [^self]. "ignoring events" 
	anEvent selection frame == self ifFalse:[^nil].
	pt := anEvent selection point x @ anEvent selection point y.
	pt := pt / self extent + 0.5.
	pt := pt * targetExtent.
	pt := pt x @ (targetExtent y - pt y).

	evtType == #mouse ifTrue:[
		buffer := {
			evtType.
			anEvent userID.
			pt x truncated.
			pt y truncated.
			anEvent buttons ifNil:[0].
			0. "modifiers"
			0. "reserved"
			0. "windowIndex"
		}].

	(evtType == #keystroke) ifTrue:[
		buffer := {
			#keyboard.
			anEvent userID.
			anEvent keyValue. "mac roman value"
			0. "keystroke"
			0. "modifiers"
			0. "utf32 value"
			0. "reserved"
			0. "host window"
		}.
	].

	buffer ifNotNil:[
		tform signal: #morphicEvent2D with: buffer.
	].