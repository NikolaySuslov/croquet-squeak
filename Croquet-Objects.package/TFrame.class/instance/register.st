Islands
register

	"Register me in the island's nameMap under my objectID."

	^ Processor activeIsland register:self name: objectID.
	