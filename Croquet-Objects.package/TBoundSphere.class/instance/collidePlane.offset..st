collision
collidePlane: norm offset: offst 

	| current |
" The plane is defined in the local coordinate frame - no transforms of vertices are necessary. Compare this to #collideFloor:transform: where the plane is the floor, and the test vertices must be transformed into global coordinate space."

	current := Vector4 new.
	current w: Float infinity.

	current := self collidePlane: norm offset: offst current: current.
	current w = Float infinity ifTrue:[^ nil. ].
	^ current.
