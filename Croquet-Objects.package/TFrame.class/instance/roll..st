transform
roll: r
	| angles |
	angles := self pitchYawRoll.
	angles z: r.
	self pitchYawRoll: angles.