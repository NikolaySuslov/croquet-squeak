comparing
unionSphere: position radius: radius
	| mn mx |
	mn := (position - radius) min: self min.
	mx := (position + radius) max: self max.
	^ TBox min: mn max: mx.