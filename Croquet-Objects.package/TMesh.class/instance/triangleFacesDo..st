enumerating
triangleFacesDo: aBlock
	"Evaluate aBlock with all the triangles defined in the receiver"
	| group fA fB fC fD |
	mode == nil ifTrue:[^nil]. "undefined"
	mode == GLPoints ifTrue:[^nil]. "point cloud"
	mode == GLLines ifTrue:[^nil]. "lines"

	1 to: faceGroups size by: 2 do:[:gIndex|
		group := faceGroups at: gIndex+1.
		mode == GLTriangles ifTrue:[
			1 to: group size by: 3 do:[:i|
				fA := group at: i.
				fB := group at: i+1.
				fC := group at: i+2.
				aBlock value: fA value: fB value: fC.
			].
		].
		mode == GLTriangleFan ifTrue:[
			group size > 0 ifTrue:[fA := group at: 1].
			3 to: group size do:[:i|
				fB := group at: i-1.
				fC := group at: i.
				aBlock value: fA value: fB value: fC.
			].
		].
		mode == GLTriangleStrip ifTrue:[
			group size > 2 ifTrue:[
				fA := group at: 1.
				fB := group at: 2.
			].
			3 to: group size do:[:i|
				fC := group at: i.
				"Ensure correct face orientation by flipping all even faces"
				i odd 
					ifTrue:[aBlock value: fA value: fB value: fC]
					ifFalse:[aBlock value: fA value: fC value: fB].
				fA := fB.
				fB := fC.
			].
		].
		mode == GLQuads ifTrue:[
			1 to: group size by: 4 do:[:i|
				fA := group at: i.
				fB := group at: i+1.
				fC := group at: i+2.
				fD := group at: i+3.
				aBlock value: fA value: fB value: fC.
				aBlock value: fA value: fC value: fD.
			].
		].
		mode == GLQuadStrip ifTrue:[
			group size > 2 ifTrue:[
				fA := group at: 1.
				fB := group at: 2.
			].
			4 to: group size by: 2 do:[:i|
				fC := group at: i-1.
				fD := group at: i.
				aBlock value: fA value: fB value: fC.
				aBlock value: fA value: fC value: fD.
				fA := fD.
				fB := fC.
			].
		].
	].