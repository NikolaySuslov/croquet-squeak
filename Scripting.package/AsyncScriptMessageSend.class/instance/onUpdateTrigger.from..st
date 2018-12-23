private
onUpdateTrigger: newValue from: oldValue
	eventSpec ifNil:[^self].
	"This is pretty ugly ... but we really need to stop any message which may have been scheduled based on the old event spec"
	myQueue := nil.
	myProcess ifNotNil:[myProcess terminate].

	(eventSpec at: 1) on: (eventSpec at: 2) unNotify: self.
	eventSpec at: 1 put: newValue.
	self isPaused ifFalse:[(eventSpec at: 1) on: (eventSpec at: 2) notify: self].