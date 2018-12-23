collision
collidePlane: normal offset: offset

	| tNormal tOffset |

" Simple test in world coordinates:"
	(boundSphere globalPosition dot: normal)-offset > boundSphere radius ifTrue:[ ^ nil ].

"Put the global coordinates of the plane into the local coordinate frame."
	tNormal := self globalOrientation orthoNormInverse localPointToGlobal: normal.
	tOffset := (tNormal dot: (self globalTransform orthoNormInverse localPointToGlobal: (normal*offset))).

	^ boundSphere collidePlane: tNormal offset: tOffset.