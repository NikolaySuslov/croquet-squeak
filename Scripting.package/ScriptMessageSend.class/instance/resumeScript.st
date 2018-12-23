accessing
resumeScript
	"Resume notifications from event sources"
	self isPaused ifFalse:[^self].
	eventSpec ifNil:[^self].
	1 to: eventSpec size by: 2 do:[:i|
		(eventSpec at: i) on: (eventSpec at: i+1) notify: self.
	].
	paused := false.
	receiver signal: #scriptStatusChanged with: selector.