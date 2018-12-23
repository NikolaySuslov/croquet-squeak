events
eventMask: newMask

	"The object owner magic in addChild 
	 sets up objectOwner links if the child has a 0 event mask.
	 So, when non-zeroing a mask, we have to undo that situation."

	(eventMask = EventNone  & (newMask ~= EventNone)) ifTrue: [
		objectOwner removeOwnership: self.
		"My kids may have been disowned while I had no mask...
	        so reclaim them."
		self frameChildrenDo: [:child | self addOwnership: child].
	]. 
	eventMask := newMask.
