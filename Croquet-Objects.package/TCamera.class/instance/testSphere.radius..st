render
testSphere: pos radius: radius
	| pposition position plane d  fsi |

	position := pos - self globalPosition.
"------- test to the near and far clip planes -------"
	plane := self lookAt.
	d := ( plane dot: position ) negated.
	fsi := frameScaleInverse.
	d + radius < (zNear*fsi) ifTrue:[^ false].
	d - radius > (zFar*fsi) ifTrue:[^false].
"------- test to the four clip planes -------"
	1 to: 4
		do: [:index | 0 > (((clipPlanesTransform at:index)
								dot: position) + radius)
				ifTrue: [^ false]].
	" portalClip is the clipping plane of the portal if we happen to be rendering inside of one. "
	portalClip ifNotNil:[
		pposition := position - portalClip translation.
		plane := Vector3 x: portalClip a13 negated y:portalClip a23 negated z: portalClip a33 negated.
		0 > ((plane dot: pposition)+ radius) ifTrue:[^ false].
	].
	^ true