driving
moveDown: md

	self translation: (self root checkMotion: 0@md negated@0 forAvatar: self).
	lockStep := true.


