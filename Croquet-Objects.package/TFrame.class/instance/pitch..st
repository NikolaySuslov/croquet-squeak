transform
pitch: p
	| angles |
	angles := self pitchYawRoll.
	angles x: p.
	self pitchYawRoll: angles.