accessing
addAttractor: attr

	attractors add: attr.	
	attrArray ifNil:[
		attrArray := Vector3Array new: size.
		lengthArray := FloatArray new: size.
		].
