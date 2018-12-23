driving
moveUp: md

	self translation: (self root checkMotion: 0@md@0 forAvatar: self).
	lockStep := true.


