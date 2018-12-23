parse
testNorm: n1 norm: n2 

	" Test to see if the angle between the surfaces of n1 and n2 is greater than the shade angle, which is equivalent to being less than the cos of the shade angle. This means that we look at the negative of the dot product because the cos between the normals is the negative of the cos of the angle between the surfaces."
	^ (n1 dot: n2) negated < shadeAngleCos.