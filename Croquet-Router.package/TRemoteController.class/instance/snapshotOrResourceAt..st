actions
snapshotOrResourceAt: resID
	| snapshot time logMsg |
	resID = sessionID ifFalse:[
		"Simple resource request"
		cacheManager ifNotNil:[snapshot := cacheManager find: resID asString].
		snapshot ifNil:[snapshot := ByteArray new].
		^ snapshot].

	time := Time millisecondClockValue.
	snapshot := self snapshot.
	time := Time millisecondClockValue - time.
	snapshot ifNil:[^nil].

	log ifNotNil:[
		logMsg := 'SNAPSHOT: ', snapshot size asStringWithCommas, ' bytes ',
			'(', time printString, ' msecs) '.
		self log: logMsg.
	].

	^ snapshot