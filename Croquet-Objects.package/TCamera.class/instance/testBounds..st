render
testBounds: bnds
	| position pposition d cp fsi |

	bnds ifNil: [^ true].
	position := bnds globalPosition - self globalPosition.
"------- test to the near and far clip planes -------"
	d := (self lookAt dot: position) negated.
	fsi := frameScaleInverse.
	d + bnds radius < (zNear*fsi) ifTrue:[^ false].
	d - bnds radius > (zFar*fsi) ifTrue:[^false].
	1 to: 4 do:[:i|
		cp := clipPlanesTransform at: i.
		(0 > ((cp dot: position)+bnds radius)) ifTrue:[ ^ false.]].

	" portalClip is the clipping plane of the portal if we happen to be rendering inside of one. "
	portalClip ifNotNil:[
		pposition := bnds globalPosition - portalClip translation.
		0 > ((portalPlane dot: pposition)+ bnds radius) ifTrue:[ ^ false].
		].
^ true