initialize
initialize
 
	| mat |
	super initialize.
	outVector := Vector3 x: 0.0 y:0.0 z:1.0.
	mat := TMaterial new.
	mat ambientColor:#(0.5 0.5 0.5 0.0).
	mat diffuseColor:#(0.5 0.5 0.5 0.0).
	super material: mat.
	postcard := self.
	self initBounds.
	self objectName:'portal'copy.
	blocked := false. 
	ghost := nil.
	overlays := {}.
"This is just to have something when I test."
"	space := TSpace new.
	postcard := TFrame new.
	space addChild: postcard."
	^self
