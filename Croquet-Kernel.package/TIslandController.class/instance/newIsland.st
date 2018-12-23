initialize
newIsland
	"Create and install new island for this controller."
	| newIsland |
	newIsland := self islandClass new.
	newIsland send:[:obj| obj controller: self].
	self island: newIsland.
	^island