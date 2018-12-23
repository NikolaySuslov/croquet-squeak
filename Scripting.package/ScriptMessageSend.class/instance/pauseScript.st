accessing
pauseScript
	"Stop notifications from event sources"
	self isPaused ifTrue:[^self].
	eventSpec ifNil:[^self].
	1 to: eventSpec size by: 2 do:[:i|
		(eventSpec at: i) on: (eventSpec at: i+1) unNotify: self.
	].
	paused := true.
	receiver signal: #scriptStatusChanged with: selector.