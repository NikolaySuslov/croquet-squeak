events
onAppExtentChanged: newExtent
	"The following code should be pushed up to TMorphicWorld."
	self flag: #jcg.
	world extent: newExtent.
	world canvas: nil.
	morph extent: newExtent.

	"'super' call is temporarily replaced by the following code:"
	self flag: #jcg.
	"super onAppExtentChanged: newExtent."

	"The following code should be pushed up to TEmbeddableApp."
	self flag: #jcg.
	extent := newExtent.
	display trueExtent = newExtent asLargerPowerOfTwo ifFalse: [
		display setupForm: ((Form extent: extent depth: 32) fillColor: Color transparent).
	].
	self invalidate.
