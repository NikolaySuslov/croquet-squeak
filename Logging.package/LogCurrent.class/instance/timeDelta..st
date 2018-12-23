public
timeDelta: timerKey
	| past now key |
	
	now := TimeStamp now.
	key := timerKey asSymbol.
	past := self properties at: key ifAbsent: nil.
	self properties at: key  put: now.
	
	past ifNil: [ ^ self time start: key ].
	
	^ self time delta: now - past
	