initialize
initBounds

	boundSphere := TBoundSphere localPosition: clipBox center radius: (clipBox diagonal)/2.
	boundSphere frame: self.
	cube initBounds.

