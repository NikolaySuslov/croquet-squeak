render
teleportTo: newTransform in: newSpace
	"Should be done better. Oh well..."
	self localTransform: newTransform.
	self enter: newSpace.