initialize
skew: vector
	"Set the skew-symetric matrix up"
	self a21: vector z.
	self a12: vector z negated.
	self a31: vector y negated.
	self a13: vector y.
	self a32: vector x.
	self a23: vector x negated.
