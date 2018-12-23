class initialization
shutDown 
	self allSubInstancesDo: [:ea | ea destroy; becomeForward: #glSuspended].
