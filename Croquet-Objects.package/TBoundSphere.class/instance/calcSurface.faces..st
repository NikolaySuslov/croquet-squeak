construct
calcSurface: verts faces: faces

"This is for a first approximation - I may need a better solution later."

	| n nabs m nlist ray t |

	normal := Vector3 new.
	nlist := OrderedCollection new.

	1 to: faces size by: 3 do:[ :i |
		
		n := 
		(((verts at:1+(faces at: i)) - (verts at:1+(faces at: i+1))) cross:
		(((verts at:1+(faces at: i)) - (verts at:1+(faces at: i+2))))).
		n squaredLength = 0.0 ifFalse:[
			nlist add: n.
			normal := normal + n. ].].

	normal := normal/( faces size/3).
	normal squaredLength = 0.0 ifTrue:[normal := Vector3 x: 0.0 y: 1.0 z: 0.0].
	normal normalize.
	nabs := normal abs.
	up := Vector3 new.

	nabs x < nabs y ifTrue:[
		nabs x < nabs z ifTrue:[up x:1.0] 
		ifFalse:[up z:1.0].]ifFalse:[
		nabs y < nabs z ifTrue:[up y: 1.0] ifFalse:[up z: 1.0]].
	side := (up cross: normal) normalized.
	up := (normal cross: side) normalized.

	m := Matrix4x4 identity.
	
	m at: 1 at: 1 put: side x.
	m at: 1 at: 2 put: side y.
	m at: 1 at: 3 put: side z.
	m at: 2 at: 1 put: up x.
	m at: 2 at: 2 put: up y.
	m at: 2 at: 3 put: up z.
	m at: 3 at: 1 put: normal x.
	m at: 3 at: 2 put: normal y.
	m at: 3 at: 3 put: normal z.

	offset := 0.
	1 to: faces size by: 3 do:[ :i |
		ray := self ray: m tri: localPosition - (verts at: 1+(faces at:i))
					tri: localPosition - (verts at: 1+(faces at: i+1))
					tri: localPosition - (verts at: 1+(faces at: i+2)).
		
		ray ifNotNil:[ 
			nabs x > nabs y ifTrue:[
				nabs x > nabs z ifTrue:[t := ray x/normal x] 
				ifFalse:[ t := ray z/normal z].]ifFalse:[
				nabs y > nabs z ifTrue:[t := ray y/normal y] ifFalse:[t := ray z/normal z]].


		t abs > offset abs ifTrue:[ offset := t negated.]]].