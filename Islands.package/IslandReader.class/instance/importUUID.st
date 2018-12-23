importing
importUUID
	| uuid |
	uuid := UUID basicNew: 16.
	dataStream next: 16 into: uuid.
	^uuid