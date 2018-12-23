render
boundSphere
	| |
	boundsChanged ifTrue:[
		self initBounds. 
		boundsChanged := false.
	"	ts := TSphere initialize: ogl.
		ts translation: boundSphere localPosition.
		ts radius: boundSphere radius.
		ts material: (TMaterial initialize: ogl).
		ts boundSphere frame: nil.
		ts segments: 4.
		self removeAll.
		self addChild: ts."
		].
	^ boundSphere.