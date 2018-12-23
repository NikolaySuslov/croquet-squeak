initialize
destroy
	AccessProtect critical:[Registry removeKey: senderID ifAbsent:[]].
	status := #invalid.
	self stopEventLoop.
	self withGcDataDo: [ : aGcData | aGcData controller: nil].
	gcData := nil.
