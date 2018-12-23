driving
moveForward: mf

	| v |
	v := localTransform lookSide .
	v := (v cross:(0@1@0))*mf negated.
	self translation:(self root checkMotion: v forAvatar: self).
	lockStep := true.


