events
passEvent: anEvent type: evtType
	"Convert the event and pass it on to the embedded app"
	| pt |
	"Make sure the event is intended for me"
	anEvent selection frame == self ifFalse:[^nil].

	"Convert from 3D to 2D"
	pt := anEvent selection point x @ anEvent selection point y.
	pt := pt / self extent + 0.5.
	pt := pt * appExtent.
	pt := pt x @ (appExtent y - pt y).

	"Dispatch event"
	(evtType == #mouseDown or:[evtType == #mouseUp or:[evtType == #mouseMove]]) ifTrue:[
		^self signal: #mouseEvent with: {
			evtType.
			anEvent timeStamp.
			anEvent buttons.
			anEvent userID.
			pt truncated.
		}.
	].
	(evtType == #keyDown or:[evtType == #keyUp or:[evtType == #keystroke]]) ifTrue:[
		^self signal: #keyboardEvent with: {
			evtType.
			anEvent timeStamp.
			anEvent buttons.
			anEvent userID.
			anEvent keyValue.
		}.
	].