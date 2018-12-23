event loop
stopEventLoop
	eventLoop ifNotNil:[eventLoop terminate].
	eventLoop := nil.