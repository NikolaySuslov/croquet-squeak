initialize
destroy
	self signal: #destroy with: self.
	self unregisterApp.
	super destroy.