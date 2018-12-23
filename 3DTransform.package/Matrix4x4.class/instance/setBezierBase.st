initialize
setBezierBase
	"Set the receiver to the bezier base matrix"
	"for further information see:
		Foley, van Dam, Feiner, Hughes
		'Computer Graphics: Principles and Practice'
		Addison-Wesley Publishing Company
		Second Edition, pp. 505"
	self
		a11: -1.0;		a12: 3.0;		a13: -3.0;	a14: 1.0;
		a21: 3.0;		a22: -6.0;	a23: 3.0;	a24: 0.0;
		a31: -3.0;	a32: 3.0;	a33: 0.0;	a34: 0.0;
		a41: 1.0;		a42: 0.0;	a43: 0.0;	a44: 0.0