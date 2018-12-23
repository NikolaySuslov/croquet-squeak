initialize
initialize
	"Initialize the receiver"
	Processor activeIsland randomStream next: self size into: self startingAt: 1.
