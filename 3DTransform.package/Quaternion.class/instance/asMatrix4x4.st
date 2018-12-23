converting
asMatrix4x4
	"Given a quaternion q = (a, [ b, c , d]) the rotation matrix can be calculated as
			|	1 -	2(cc+dd),		2(bc-da),		2(db+ca)	|
		m =	|		2(bc+da),	1 - 	2(bb+dd),		2(cd-ba)		|
			|		2(db-ca),		2(cd+ba),	1 -	2(bb+cc)	|
	"
	| a b c d m bb cc dd bc cd db ba ca da |
	a := self a. b := self b. c := self c. d := self d.
	bb := (b * b).	cc := (c * c).	dd := (d * d).
	bc := (b * c).	cd := (c * d).	db := (d * b).
	ba := (b * a).	ca := (c * a).	da := (d * a).
	m := self matrixClass identity.
	m 
		a11: 1.0 - (cc + dd * 2.0);a12: (bc - da * 2.0); 		a13: (db + ca * 2.0);
		a21: (bc + da * 2.0);		a22: 1.0 - (bb + dd * 2.0);a23: (cd - ba * 2.0);
		a31: (db - ca * 2.0);		a32: (cd + ba * 2.0);		a33: 1.0 - (bb + cc * 2.0).
	^m
