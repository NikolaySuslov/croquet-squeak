accessing
frameBox
	"Answer the local bounding box of this frame"
	boundsChanged ifTrue:[self initBounds].
	boundSphere ifNil:[^super frameBox].
	^boundSphere box ifNil:[super frameBox]