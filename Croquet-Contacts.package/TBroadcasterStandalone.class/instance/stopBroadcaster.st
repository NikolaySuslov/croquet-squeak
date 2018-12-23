as yet unclassified
stopBroadcaster

	broadcaster ifNotNil:[
		self destroy.
		broadcaster terminate].
	broadcaster := nil.