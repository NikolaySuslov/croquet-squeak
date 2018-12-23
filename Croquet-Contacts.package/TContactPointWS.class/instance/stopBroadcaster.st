broadcaster
stopBroadcaster
	broadcaster ifNotNil:[
		wsBroadcaster ifNotNil:[wsBroadcaster close].
		broadcaster terminate].
	broadcaster := nil.