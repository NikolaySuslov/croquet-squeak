*logging
logEntry: aLogEntry

 	self semaphore critical:[

		self << aLogEntry stamp asTime print24 << '[' << aLogEntry pid << '] ' << (aLogEntry category ifNil: [ aLogEntry level ]) << ' ' << aLogEntry line; cr.
		self changed: #appendEntry.
		self reset.

 	].