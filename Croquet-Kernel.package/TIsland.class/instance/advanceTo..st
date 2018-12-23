event loop
advanceTo: nowTime
	"Advance this island's simulation to nowTime"
	| msg msgTime |

	[msg := messageQueue firstOrNil.
	msg == nil or:[msg time > nowTime]] whileFalse:[
		msgTime := msg time.
		messageQueue removeFirst.
		msgTime < time ifTrue:[^self errorPastMessage: msg].
		time := msgTime.
		self execute: msg.
	].
	time := nowTime.
