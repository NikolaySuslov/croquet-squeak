events
pointerMove: event
	" #pointerMove: determines which cell we have clicked inside of and after proper bounds checking, it adds a spring force to that cell and a few surrounding it. The #step routine then calculates the wave functions based upon this disturbance."
	| loc dx dy index |

	dx := self extent x/2.
	dy := self extent y/2.
	(loc := event selection point) ifNil:[^nil].
	loc := loc - location.

	dx := (0.5+(loc x/extent x) * size x) asInteger.
	dx = size x ifTrue:[dx := dx-1.].
	dy := (0.5+(loc y/extent y)* size y) asInteger.
	dy = size y ifTrue:[dy := dy -1].
	index := (dy*size x + dx).
	self impulse: index.