frameManagement
doStart: frame

	frame do:[:f | (f future: f stepTime)start.].
