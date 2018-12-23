driving
takeMeThere: event

	"Go near whatever we're pointing to."

	| selection target ep |
	"Force pick, but restricted to the current space."
 
	harness ogl forcePick: true.
	harness ogl suppressPortals: true.
	harness render.
	ep := harness ogl eventPointer.
	harness ogl suppressPortals: false.

	ep ifNil: [
		^self.
	].
	target := ep selection frameID.

	"If we found something at the pick point, go to it."
	target ifNotNil: [
		selection := ep selection.
		replica future takeMeTo: selection orientation: ep globalOrientation.
	].



