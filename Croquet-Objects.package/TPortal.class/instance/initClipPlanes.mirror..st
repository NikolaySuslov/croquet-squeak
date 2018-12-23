transform
initClipPlanes: camTrans mirror: mirror
	| clip dx dy trans v1 v2 v3 v4 |

"calculate the four camera clipping planes based upon the location of the portal relative to the camera. camTrans is the cameras global transform matrix. If any part of the portal is behind the camera, revert to the current clipping planes."

	clip := Vector3Array ofSize: 4.
	
	dx := self extent x/2.
	dy := self extent y/2.
	trans := camTrans orthoNormInverse * self globalTransform.

	v1 := trans localPointToGlobal:(Vector3 x: location x + dx negated y: location y + dy z: location z).
	v1 z > 0.0 ifTrue:[^ nil.].
	v2 := trans localPointToGlobal:(Vector3 x: location x + dx negated y: location y + dy negated z:location z).
	v2 z > 0.0 ifTrue:[^ nil.].
	v3 := trans localPointToGlobal:(Vector3 x: location x + dx y: location y + dy negated z: location z).
	v3 z > 0.0 ifTrue:[ ^ nil.].
	v4 := trans localPointToGlobal:(Vector3 x: location x + dx y: location y + dy z: location z).
	v4 z > 0.0 ifTrue:[ ^ nil.].
	
	mirror ifFalse:[
		clip at: 1 put: ((v2 cross: v1) safelyNormalized).
		clip at: 2 put: ((v3 cross: v2) safelyNormalized).
		clip at: 3 put: ((v4 cross: v3) safelyNormalized).
		clip at: 4 put: ((v1 cross: v4) safelyNormalized).
	] ifTrue: [
		clip at: 1 put: ((v1 cross: v2) safelyNormalized).
		clip at: 2 put: ((v2 cross: v3) safelyNormalized).
		clip at: 3 put: ((v3 cross: v4) safelyNormalized).
		clip at: 4 put: ((v4 cross: v1) safelyNormalized).
	].
	^ clip.