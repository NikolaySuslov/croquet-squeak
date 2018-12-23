initialize
initializeOpaque: aBool extent: targetExtent
| mat |
	self 
		initializeWithForm: (Form extent: targetExtent depth: 32) 
		mipmap: false "aCroquetWorld ogl autoMipmap"
		shrinkFit: false. "the form needs to grow"
	self uvScale: (tform extent/tform extent) asFloatPoint.
	mat := TMaterial new.
	aBool ifTrue:[
		mat ambientColor: #(1.0 1.0 1.0 1).
		mat diffuseColor: #(1.0 1.0 1.0 1).
	] ifFalse:[
		mat ambientColor: #(1.0 1.0 1.0 0.9).
		mat diffuseColor: #(1.0 1.0 1.0 0.9).
	].
	mat emissiveColor: #(1.0 1.0 1.0 1.0).
	super material: mat.
	^self.