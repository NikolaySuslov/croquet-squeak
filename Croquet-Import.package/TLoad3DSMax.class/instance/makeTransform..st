parse
makeTransform: tree

	| field fieldName matrix v mOffset start end m90 |
	matrix := Matrix4x4 identity.
	tree linksDo:[ :node |
		fieldName := node name.
		field := node value.
		fieldName = #TNodeName ifTrue:[ "I put this here because groups don't give me a node name."
			start := field findDelimiters: '"' startingAt: 1.
			end := field findDelimiters: '"' startingAt: start+1.
			self objectName: (field copyFrom: start+1 to: end-1).
			].
		fieldName = #TTmRow0 ifTrue:[ 
			v := self makeNumberArray: field. 
			matrix a11: (v at: 1).
			matrix a21: (v at: 2).
			matrix a31: (v at: 3).
			].
		fieldName = #TTmRow1 ifTrue:[			
			v := self makeNumberArray: field. 
			matrix a12: (v at: 1).
			matrix a22: (v at: 2).
			matrix a32: (v at: 3).
			].
		fieldName = #TTmRow2 ifTrue:[
			v := self makeNumberArray: field. 
			matrix a13: (v at: 1).
			matrix a23: (v at: 2).
			matrix a33: (v at: 3).
			].
		fieldName = #TTmRow3 ifTrue:[ "********TRANSLATION FIELD******"
			v := self makeNumberArray: field. 
			matrix a14: (v at: 1) * scale.
			matrix a24: (v at: 2) * scale.
			matrix a34: (v at: 3) * scale .
			].
		fieldName = #TTmScale ifTrue:[ "*********SCALE FIELD************"
			v := self makeNumberArray: field.
			v at: 1 put:(1.0/v at:1).
			v at: 2 put:(1.0/v at:2).
			v at: 3 put:(1.0/v at:3).
			matrix a11: matrix a11*(v at:1).
			matrix a21: matrix a21*(v at:1).
			matrix a31: matrix a31*(v at:1).

			matrix a12: matrix a12*(v at:2).
			matrix a22: matrix a22*(v at:2).
			matrix a32: matrix a32*(v at:2).

			matrix a13: matrix a13*(v at:3).
			matrix a23: matrix a23*(v at:3).
			matrix a33: matrix a33*(v at:3).
			].
				" I am not sure if I need this next matrix or not."
		fieldName = #TNodeObjectoffset ifTrue:[ 
			mOffset := self makeTransform: field.
			].
		].

	m90 := Matrix4x4 identity rotationAroundX: -90.
	matrix := (m90 composeWith: matrix) composeWith: m90 orthoNormInverse.

"	^ B3DMatrix4x4 identity translation: (matrix translation)."
	^ matrix.