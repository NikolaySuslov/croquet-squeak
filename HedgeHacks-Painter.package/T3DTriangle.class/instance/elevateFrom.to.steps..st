elevation
elevateFrom: baseVertex to: elevationVertex steps: nSteps
	| centerVertex nrm rot vtxList vtx vertex zScale dirVtx |
	centerVertex := elevationVertex x @ elevationVertex y @ 0.
	dirVtx := baseVertex - centerVertex.
	zScale := elevationVertex z / dirVtx length.
	zScale := Matrix4x4 withScale: 1@1@zScale.
	nrm := dirVtx y @ dirVtx x negated @ 0.
	vtxList := Array new: nSteps+1.
	0 to: nSteps do:[:i|
		i = 0 ifTrue:[
			vtx := baseVertex.
		] ifFalse:[i = nSteps ifTrue:[
			vtx := elevationVertex.
		] ifFalse:[
			rot := (Quaternion angle: 90.0 * i / nSteps axis: nrm) asMatrix4x4
					composedWithGlobal: zScale.
			vtx := rot localPointToGlobal: dirVtx.
			vtx := vtx + centerVertex.
		]].
		vertex := T3DSimpleVertex new.
		vertex position: vtx.
		vertex normal: Vector3 new.
		"vertex normal: (vtx - centerVertex) normalized."
		vtxList at: i+1 put: vertex].
	^vtxList