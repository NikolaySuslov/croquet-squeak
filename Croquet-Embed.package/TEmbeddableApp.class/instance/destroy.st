initialize
destroy
	"Destroy the app"
	"Should we try to deregister here?...if we do, where do we get the harnesss from?  or should it just be a signal?"
	self flag: #jrd.
	self signal: #destroy with: self.