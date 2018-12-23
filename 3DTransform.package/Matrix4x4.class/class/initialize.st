class initialization
initialize
	"Matrix4x4 initialize"
	ZeroMatrix := self new.
	IdentityMatrix := self new.
	IdentityMatrix a11: 1.0; a22: 1.0; a33: 1.0; a44: 1.0.