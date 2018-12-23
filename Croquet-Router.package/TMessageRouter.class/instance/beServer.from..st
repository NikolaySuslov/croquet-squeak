actions
beServer: data from: aClient
	"Mark aClient as a server, e.g., a participant trusted to replicate an island"
	aClient serveFacet: (data copyFrom: 1 to: 16).
	self logMessage: (self printClient: aClient), ': new server'.
	self isProxy ifTrue: [upstream ensureServeFacet].