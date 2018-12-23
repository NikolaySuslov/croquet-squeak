initialize
setBetaSplineBaseBias: beta1 tension: beta2
	"Set the receiver to the betaSpline base matrix 
	if beta1=1 and beta2=0 then the bSpline base matrix will be returned"
	"for further information see:
		Foley, van Dam, Feiner, Hughes
		'Computer Graphics: Principles and Practice'
		Addison-Wesley Publishing Company
		Second Edition, pp. 505"
	| b12 b13 delta |
	b12 := beta1 * beta1.
	b13 := beta1 * b12.
	delta := 1.0 / (beta2 + (2.0 * b13) + 4.0 * (b12 + beta1) +2.0).
	
	self
		a11: delta * -2.0 * b13;
		a12: delta * 2.0 * (beta2 + b13 + b12 + beta1);
		a13: delta * -2.0 * (beta2 + b12 + beta1 + 1.0);
		a14: delta * 2.0;
		a21: delta * 6.0 * b13;
		a22: delta * -3.0 * (beta2 + (2.0 * (b13 + b12)));
		a23: delta * 3.0 * (beta2 + (2.0 * b12));
		a24: 0.0;
		a31: delta * -6.0 * b13;
		a32: delta * 6.0 * (b13 - beta1);
		a33: delta * 6.0 * beta1;
		a34: 0.0;
		a41: delta * 2.0 * b13;
		a42: delta * (beta2 + 4.0 * (b12 + beta1));
		a43: delta * 2.0;
		a44: 0.0
