initialize
initBounds
	boundSphere := TBoundSphere localPosition: Vector3 new radius: radius + (extent r / 2).
	boundSphere frame: self.
