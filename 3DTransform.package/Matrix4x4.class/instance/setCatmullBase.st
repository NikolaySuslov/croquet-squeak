initialize
setCatmullBase
	"Set the receiver to the Catmull-Rom base matrix"
	"for further information see:
		Foley, van Dam, Feiner, Hughes
		'Computer Graphics: Principles and Practice'
		Addison-Wesley Publishing Company
		Second Edition, pp. 505"
	self
		a11: -0.5;	a12: 1.5;		a13: -1.5;	a14: 0.5;
		a21: 1.0;		a22: -2.5;	a23: 2.0;	a24: -0.5;
		a31: -0.5;	a32: 0.0;	a33: 0.5;	a34: 0.0;
		a41: 0.0;		a42: 1.0;		a43: 0.0;	a44: 0.0
