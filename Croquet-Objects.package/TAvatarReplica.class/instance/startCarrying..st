accessing
startCarrying: aFrame

	"Add the frame to the avatar's carrying frame,
	 preserving its current global position."

	| xform |
	xform := aFrame globalTransform.
	self carrying: aFrame.
	aFrame localTransform: (self globalTransform orthoNormInverse composeWith: xform).