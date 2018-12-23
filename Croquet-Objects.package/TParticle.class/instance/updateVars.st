accessing
updateVars

	| |
	maxTime := lifetimeRange max.
	endColor ifNotNil:[
		pColor ifNil:[ pColor := VectorColor4Array new: size.
					pDeltaColor := VectorColor4Array new: size.
				].
		].
	material ambientColor: startColor.
	material diffuseColor: startColor.
