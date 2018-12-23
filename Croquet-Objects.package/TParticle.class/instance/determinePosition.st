render
determinePosition
	| msecs tt |
	msecs := (tt := self now asFloat) - (lastStepTime asFloat).
	msecs = 0 ifTrue: [^self].
	deltaTime := msecs.
	lastStepTime := tt.
	lastGlobalPosition ifNotNil:[
		globalVelocity := (self globalPosition - lastGlobalPosition)/msecs * 1000.0.
		].
	lastGlobalPosition := self globalPosition.
