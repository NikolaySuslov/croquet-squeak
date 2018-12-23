initialize
setCardinalBase
	"Set the receiver to the cardinal spline base matrix - just catmull * 2"
	"for further information see:
		Foley, van Dam, Feiner, Hughes
		'Computer Graphics: Principles and Practice'
		Addison-Wesley Publishing Company
		Second Edition, pp. 505"
	self
		a11: -1.0;		a12: 3.0;		a13: -3.0;	a14: 1.0;
		a21: 2.0;		a22: -5.0;	a23: 4.0;	a24: -1.0;
		a31: -1.0;	a32: 0.0;	a33: 1.0;		a34: 0.0;
		a41: 0.0;		a42: 2.0;	a43: 0.0;	a44: 0.0
