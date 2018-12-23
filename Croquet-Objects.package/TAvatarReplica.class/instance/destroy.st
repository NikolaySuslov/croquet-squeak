initialize
destroy
	"Allow avatar tracking"
	self root signal: #avatarLeave with: self.
	^super destroy.