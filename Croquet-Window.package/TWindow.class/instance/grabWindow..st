actions
grabWindow: event
	| atar |
	atar := event avatar ifNil:[^nil].
	atar startCarrying: self.