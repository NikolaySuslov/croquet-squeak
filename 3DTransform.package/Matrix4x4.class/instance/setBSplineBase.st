initialize
setBSplineBase
	"Set the receiver to the BSpline base matrix"
	"for further information see:
		Foley, van Dam, Feiner, Hughes
		'Computer Graphics: Principles and Practice'
		Addison-Wesley Publishing Company
		Second Edition, pp. 505"
	self
		a11: -1.0 / 6.0;	a12: 3.0 / 6.0;	a13: -3.0 / 6.0;	a14: 1.0 / 6.0;
		a21: 3.0 / 6.0;	a22: -6.0 / 6.0;	a23: 3.0 / 6.0;	a24: 0.0 / 6.0;
		a31: -3.0 / 6.0;	a32: 0.0 / 6.0;	a33: 3.0 / 6.0;	a34: 0.0 / 6.0;
		a41: 1.0 / 6.0;	a42: 4.0 / 6.0;	a43: 1.0 / 6.0;	a44: 0.0 / 6.0
