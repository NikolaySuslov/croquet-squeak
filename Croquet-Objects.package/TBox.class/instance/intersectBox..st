comparing
intersectBox: bx
	| mn mx |
	mn := bx min max: self min.
	mx := bx max min: self max.
	^ TBox min: mn max: mx.