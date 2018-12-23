accessing
default
	"Return the system-wide default island"
	| island |
	Default ifNil:[
		Default := self basicNew initialize.
		Default name: 'Squeak' copy.
	].
	island := Processor activeProcess island.
	island ifNil:[^Default] ifNotNil:[^(Default asFarRef: Default) valueOn: island].