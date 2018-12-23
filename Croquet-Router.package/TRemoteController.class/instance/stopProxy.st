proxy
stopProxy
	self isProxy ifFalse: [^ self].
	downstream destroy.
	downstream := nil.
	self updateHeartbeat.

	"also need to revoke server facet for the upstream router if I am not a server but one of my children was. Currently no way in the protocol to tell the other side about a revoked facet"
	self flag: #mtf.