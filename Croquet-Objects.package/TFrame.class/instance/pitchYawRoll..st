transform
pitchYawRoll: aVector
	| tfm |
	tfm := localTransform copy pitchYawRoll: aVector.
	self localTransform: tfm.