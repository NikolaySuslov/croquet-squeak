accessing
default
	"TSessionDispatcher default listenOn: 1234"
	^Default ifNil:[Default := self new]