transform
yaw: y
	| angles |
	angles := self pitchYawRoll.
	angles y: y.
	self pitchYawRoll: angles.