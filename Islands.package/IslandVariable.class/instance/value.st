accessing
value
	"Answer the receiver's value. Resolve far refs to the current island."
	| v |
	v := value. "read value atomically"
	v isFarRef 
		ifTrue:[^v varValueOn: Processor activeIsland]
		ifFalse:[^v]
