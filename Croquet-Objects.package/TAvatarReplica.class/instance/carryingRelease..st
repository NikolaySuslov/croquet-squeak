accessing
carryingRelease: aFrame

	"Release the given frame (which I am assumed to be carrying)
	 into the space; it retains its current global position in the space."

	carrying ifNotNil:[
		aFrame releaseToRoot.
		carrying frameChildren size = 0 ifTrue:[
			self removeChild: carrying.
			carrying := nil].].