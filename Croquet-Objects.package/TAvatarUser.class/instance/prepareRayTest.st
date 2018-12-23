portals
prepareRayTest

	| pos delta trans  |


	pos := (replica get: #translation).
"	lastPosition := (replica get: #lastPosition)."
lastPosition ifNil:[lastPosition := pos. ].
	(pos - lastPosition)length>0.0001 ifTrue:[
		portalRay resetTotal.
		delta := lastPosition-pos.
		(delta x = 0 and:[delta z = 0])ifTrue:[
			trans := Matrix4x4 at: delta up:(1@0@0) ]ifFalse:[
			trans := Matrix4x4 at: delta up:(0@1@0) ].
		trans translation: lastPosition.
		portalRay globalTransform: trans.
		portalRay maxDistance: (delta length max:0.5).
		portalRay doSelect: true. "turn this on only if we have a valid movement"
		lastPosition := pos.
		^ true.
	].
	portalRay doSelect: false. "there is no ray to test for - don't use the last one"
	^ false.