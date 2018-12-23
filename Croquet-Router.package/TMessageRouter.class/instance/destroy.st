initialize
destroy
	upstream := nil.
	clients do:[:each| each destroy].
	self stopEventLoop.
