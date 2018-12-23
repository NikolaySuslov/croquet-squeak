transforming
transposed
	"Return a transposed copy of the receiver"
	| matrix |
	<primitive: 'primitiveTransposeMatrix' module: 'CroquetPlugin'>
	matrix := self class new.
	matrix 
		a11: self a11; a12: self a21; a13: self a31; a14: self a41;
		a21: self a12; a22: self a22; a23: self a32; a24: self a42;
		a31: self a13; a32: self a23; a33: self a33; a34: self a43;
		a41: self a14; a42: self a24; a43: self a34; a44: self a44.
	^matrix