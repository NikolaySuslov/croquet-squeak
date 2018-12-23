initialize
initializeWithVertices: v alias: a norms: n textureUV: tuv faceGroups: fg material: ml mode: md 
	| mat |
	alias := a.
	mode := md.
	self 
		vertices: v;
		normals: n;
		texCoords: tuv;
		faceGroups: fg.
	alpha := false.
	opaque := false.
	mat := ml.
	mat ifNil:[ 
		mat := TMaterial new.
		mat ambientColor: #(1.0 0.2 0.2 0.5).
		mat diffuseColor: #(1.0 0.2 0.2 0.5).
	].
	mat subMaterialList ifNotNil:[ materialList := mat subMaterialList. ]
	ifNil:[
		materialList := OrderedCollection new.
		materialList add: mat.
		1 to: faceGroups size by: 2 do:[ :i |
			faceGroups at: i put: 1. 
		].
	].

	1 to: faceGroups size by: 2 do:[:i |
		faceGroups at: i put: 1+(((faceGroups at: i)-1)\\materialList size).
		((materialList at:(faceGroups at: i)) hasAlpha) 
			ifTrue:[self setAlpha: true] 
			ifFalse:[ self setOpaque: true].
	].
	self optimizeFaceGroups.

	boundsDepth := 2. "must always be a mimimum of 1 - the top sphere, and at least one recursion."
	self boundsChanged.
	^self
