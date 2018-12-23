accessing
nextUUID
	| uuid |
	uuid := UUID nilUUID.
	self next: 16 into: uuid.
	^uuid