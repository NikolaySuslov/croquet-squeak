broadcaster
stopBroadcaster
	broadcaster ifNotNil:[broadcaster terminate].
	broadcaster := nil.