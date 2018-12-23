initialize
install: data
	| time newIsland logMsg newTime nextMsg |
	time := Time millisecondClockValue.
	newIsland := self restore: data.
	time := Time millisecondClockValue - time.
	log ifNotNil:[
		logMsg := 'STARTUP: ', data size asStringWithCommas, ' bytes ',
			'(', time printString, ' msecs) '.
		self log:logMsg.
	].
	"Drop all messages before the islands time"
	newTime := newIsland send:[:obj| obj time].
	[true] whileTrue:[
		nextMsg := networkQueue next.
		nextMsg time > newTime ifTrue:[
			"This is the first 'real' message arriving."
			newIsland send:[:obj| obj decodeScheduleAndExecute: nextMsg]. "execute it"
			self island: newIsland. "install island"
			^nil]. "done"
		"otherwise, silently skip the message"
	].