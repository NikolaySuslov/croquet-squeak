instance creation
new
	"Create a new island."
	| island prior |
	prior := Processor activeIsland.
	island := self basicNew.
	Processor activeIsland: island.
	island initialize.
	Processor activeIsland: prior.
	^island asFarRef: island