accessing
wakeupScript
	"Resume notifications from event sources"
	eventSpec ifNil:[^self].
	1 to: eventSpec size by: 2 do:[:i|
		(eventSpec at: i) on: (eventSpec at: i+1) notify: self.
	].
	paused := false.