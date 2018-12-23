initialize
updateMesh
	| ringSin ringCos segs halfSegs pi2 ax vert norm texCoord dx dy count savedVert savedNorm savedTexCoord stream rowCount totalCount |

	vert := Vector3 new.
	norm := Vector3 new.
	texCoord := Vector2 new.
	segs := 4 * segments.
	halfSegs := 2 * segments.
	ringSin := FloatArray ofSize: segs+1.
	ringCos := FloatArray ofSize: segs+1.
	pi2 := Float pi * 2.0.

	"Calculate the number of vertices in a 'row', and the total number of vertices."
	rowCount := 4*(segments+1) + 5.
	totalCount := (halfSegs+1)*rowCount.
	vertexBuffer := Vector3Array ofSize: totalCount.
	normalBuffer := Vector3Array ofSize: totalCount.
	texCoordBuffer := Vector2Array ofSize: totalCount.

	1 to: segs do: [:index |
		ax := ((index-1) * pi2) / segs.
		ringSin at: index put: ax sin.
		ringCos at: index put: ax cos.].

	ringSin at: segs+1 put: (ringSin at: 1).
	ringCos at: segs+1 put: (ringCos at: 1).
	dx := extent x/2.0.
	dy := extent y/2.0.
	count := 0.

	count := 1.

	1 to: halfSegs+1 do:[ :iv |
" ---- top right ---- "
		1 to: segments+1 do:
			[:ih |
			norm
				x: (ringSin at: iv) * (ringSin at: ih)
				y: (ringSin at: iv) * (ringCos at: ih)
				z: (ringCos at: iv).
			texCoord u: 0.5 - 0.125 v: 0.0.
			vert := norm * radius.
			vert x: vert x + dx.
			vert y: vert y + dy.
			vertexBuffer at: count put: vert.
			normalBuffer at: count put: norm.
			texCoordBuffer at: count put: texCoord.
			count := count + 1.

			"Need to repeat the first one at the end."
			ih = 1 ifTrue:
				[savedVert := vert copy. 
				savedNorm := norm copy. 
				savedTexCoord := texCoord copy].
			].
		vert y: 0.
		texCoord u: 0.5 - 0.25 v: 0.0.
		vertexBuffer at: count put: vert.
		normalBuffer at: count put: norm.
		texCoordBuffer at: count put: texCoord.
		count := count + 1.

" ---- bottom right ----- "
		segments+1 to: (2*segments)+1 do:
			[:ih |
			norm
				x: (ringSin at: iv) * (ringSin at: ih)
				y: (ringSin at: iv) * (ringCos at: ih)
				z: (ringCos at: iv).
			texCoord u: 0.5 - 0.375 v: 0.0.
			vert := norm * radius.
			vert x: vert x + dx.
			vert y: vert y - dy.
			vertexBuffer at: count put: vert.
			normalBuffer at: count put: norm.
			texCoordBuffer at: count put: texCoord.
			count := count + 1.
			].
		vert x: 0.
		texCoord u: 0.5 - 0.5 v: 0.
		vertexBuffer at: count put: vert.
		normalBuffer at: count put: norm.
		texCoordBuffer at: count put: texCoord.
		count := count + 1.

" ---- bottom left ---- "
		(2*segments)+1 to: (3*segments)+1 do:
			[:ih |
			norm 
				x: (ringSin at: iv) * (ringSin at: ih)
				y: (ringSin at: iv) * (ringCos at: ih)
				z: (ringCos at: iv).
			texCoord u: 0.5 - 0.625 v: 0.0.
			vert := norm * radius.
			vert x: vert x - dx.
			vert y: vert y-  dy.
			vertexBuffer at: count put: vert.
			normalBuffer at: count put: norm.
			texCoordBuffer at: count put: texCoord.
			count := count + 1.
			].
		vert y: 0.
		texCoord u: 0.5 - 0.75 v: 0.
		vertexBuffer at: count put: vert.
		normalBuffer at: count put: norm.
		texCoordBuffer at: count put: texCoord.
		count := count + 1.

" ---- top left ----- "
		(3*segments)+1 to: (4*segments)+1 do:
			[:ih |
			norm 
				x: (ringSin at: iv) * (ringSin at: ih)
				y: (ringSin at: iv) * (ringCos at: ih)
				z: (ringCos at: iv).		
			texCoord u: 0.5 - 0.875 v: 0.0.
			vert := norm * radius.
			vert x: vert x - dx.
			vert y: vert y +  dy.
			vertexBuffer at: count put: vert.
			normalBuffer at: count put: norm.
			texCoordBuffer at: count put: texCoord.
			count := count + 1.
			].
		vert x: 0.
		texCoord u: 0.5 - 1.0 v: 0.
		vertexBuffer at: count put: vert.
		normalBuffer at: count put: norm.
		texCoordBuffer at: count put: texCoord.
		count := count + 1.

		savedTexCoord u: 0.5 - 1.125 v: 0.
		vertexBuffer at: count put: savedVert.
		normalBuffer at: count put: savedNorm.
		texCoordBuffer at: count put: savedTexCoord.
		count := count + 1.
	].

	(count-1) = 	(totalCount) ifFalse: [self error: 'I Miscalculated the number of vertices!!'].

	"Compute face groups."
	faceGroups := OrderedCollection new.
	0 to: halfSegs-1 do: 
		[:iv |
		faceGroups add: 1.	"material index"
		stream := WriteStream on: IntegerArray new.
		0 to: rowCount-1 do: [:ih | stream
									nextPut: ((iv+1)*rowCount) + ih;
									nextPut: (iv*rowCount) + ih].
		faceGroups add: stream contents].
	self faceGroups: faceGroups.
		
	"doInside ifTrue:[self glRenderInside: ogl x: dx y: dy.]."

	changed := false.


	
