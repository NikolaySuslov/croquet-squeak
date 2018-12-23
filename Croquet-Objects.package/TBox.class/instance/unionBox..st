comparing
unionBox: bx
	| mn mx |
	mn := bx min min: self min.
	mx := bx max max: self max.
	^ TBox min: mn max: mx.