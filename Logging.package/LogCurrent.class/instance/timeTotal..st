public
timeTotal: timerKey
	| past now key |
	
	now := TimeStamp now.
	key := timerKey asSymbol.
	past := self properties at: key ifAbsent: nil.
	
	past ifNil: [ self properties at: key put: now.
				^ self time start: key ].
	
	^ self time total: now - past
	