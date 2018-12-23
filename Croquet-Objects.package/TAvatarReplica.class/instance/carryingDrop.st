accessing
carryingDrop
	"Drop all the things I'm carrying... they pop back to their pickup locations."

	carrying ifNotNil:[
		carrying frameChildren do:[:each|
			each releaseToRoot.
			each localTransform: (originalTransforms at: each).
		].
		self removeChild: carrying.
		carrying := nil.
	].