stepping
step
	"rotation is dalpha units per 20 milliseconds, and we assume start at zero clock time" 
	self rotationAroundY: (IslandTime millisecondClockValue asFloat/20.0) * dalpha.
	(self future: 20) step