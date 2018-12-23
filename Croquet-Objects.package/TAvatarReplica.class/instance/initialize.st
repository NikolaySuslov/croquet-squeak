initialize
initialize
	| downMatrix |

	super initialize.
	height := 4.6.
	originalTransforms := Dictionary new.
	lastDownPosition := Vector3 new.
	footFrame := TGroup new.
	downMatrix := Matrix4x4 identity rotationAroundX: -90.
	downPointer := TRay new.
	downPointer localTransform: downMatrix.
	downPointer downRay: true.
	self addChild: downPointer.
	driving := false.
	speedControl := 0@0.
	controlPitch := false.
	sticky := false.
	aliveTimeout := 60000. "self-destruct after 60 seconds without activity."
	self stillAlive.
	lockStep := false.
	lockLockStep := false.
