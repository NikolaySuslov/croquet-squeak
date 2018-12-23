render
doRenderAlpha: ogl
	"This is used to render transparent ( alpha blended ) objects."

	| hilite |

	hilite := false.
	self currentHiliteColor ifNotNil: [
		hilite := ogl forceHilite: self currentHiliteColor.
		hilite ifTrue: [
			ogl pushFog.
		].
	].

	ogl transparency < 1.0 ifTrue:[
		self render: ogl.
	].
	self renderAlpha: ogl.

	hilite  ifTrue: [
		ogl forceHilite: nil.
		ogl popFog.
	].