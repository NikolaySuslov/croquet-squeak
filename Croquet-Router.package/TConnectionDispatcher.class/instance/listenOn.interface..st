initialize
listenOn: port interface: interface
	"Start me on the given port/interface"
	^self listenOn: port interface: interface backlogSize: 8