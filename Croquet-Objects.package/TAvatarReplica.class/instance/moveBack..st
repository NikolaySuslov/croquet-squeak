driving
moveBack: mb

	| v |
	v := localTransform lookSide .
	v := (v cross:(0@1@0))*mb.
	self translation: (self root  checkMotion: v forAvatar: self).
	lockStep := true.

