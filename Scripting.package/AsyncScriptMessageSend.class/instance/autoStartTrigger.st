private
autoStartTrigger
	myTrigger ifNil:[^nil].
	myTrigger changeEvent ifNil:[^nil].
	self startScript: #onEventSourceChanged when: {receiver. myTrigger changeEvent}.
	self onEventSourceChanged.