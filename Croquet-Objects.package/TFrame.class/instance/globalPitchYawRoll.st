transform
globalPitchYawRoll
	globalTransform ifNil:[^ 0.0@0.0@0.0].
	^globalTransform pitchYawRoll