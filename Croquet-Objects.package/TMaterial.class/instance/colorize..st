accessing
colorize: col
	"Preserve alpha when colorizing material"
	| ac dc |
	ac := col asVectorColor copy.
	ac alpha: ambientColor alpha.
	dc := col asVectorColor copy.
	dc alpha: diffuseColor alpha.
	self ambientColor: ac.
	self diffuseColor: dc.
