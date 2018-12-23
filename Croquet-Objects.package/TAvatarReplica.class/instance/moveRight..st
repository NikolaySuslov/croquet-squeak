driving
moveRight: mr

	| v |
	v := localTransform lookAt.
	v := (v cross:(0@1@0))*mr negated.
	self translation: (self root checkMotion: v forAvatar: self).
	lockStep := true.


