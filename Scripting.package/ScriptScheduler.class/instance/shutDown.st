initialize
shutDown
	"Shut down the receiver"
	| aScript |
	self scheduledScriptsDo:[:script| script terminate].
	"Terminate activeList explicitly - we may have scripts waiting to be scheduled there"
	[aScript := activeList firstOrNil.
	aScript == nil] whileFalse:[aScript terminate].