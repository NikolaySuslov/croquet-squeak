transforming
counterTransposed
	"flip across the other diagonal from normal transpose. Just the 3x3 part. Do not use this unless you really know what you are doing."

	| matrix |
	matrix := self class new.
	matrix 
		a11: self a33; a12: self a23; a13: self a13; 	a14: self a14;
		a21: self a32; a22: self a22; a23: self a12; 	a24: self a24;
		a31: self a31; a32: self a21; a33: self a11; 	a34: self a34;

		a41: self a41; a42: self a42; a43: self a43; 	a44: self a44.
	^matrix