router tests
testParticipantStage2
	"Login, sync and join participant"
	| pt xx yy promise |
	self testParticipantStage1.

	"Login participant"
	self loginMember: participant.
	self assert: participant status == #ready.

	promise := participant join. 	"request messages"
	promise wait.
	participant heartbeat: 1000.
	promise := participant sync. 	"request replicated state"
	promise wait.
	self assert: promise isResolved.
	participant install: promise result.	"install replicated state"

	participant island send:[:obj| pt := obj at: #testPoint].
	pt send:[:obj|
		xx := obj x.
		yy := obj y.
	].
	self assert: xx = 123.
	self assert: yy = 456.
