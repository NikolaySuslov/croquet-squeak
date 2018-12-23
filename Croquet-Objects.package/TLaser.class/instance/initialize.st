accessing
initialize

	| glow |
	super initialize.
	arrowLength := 0.5.
	radius := 0.025.
	length := 1.0.
	color := #(5.0 0.0 0.1 0.35).

	shaft := TGroup new.
	shaft rotationAroundX: -90.0.
	self addChild: shaft.

	point := TGroup new.
	point rotationAroundX: -90.0.
	point translationX: 0.0 y:0.0 z:arrowLength-length.
	self addChild: point.

	glowMaterial := TMaterial new.
	glowMaterial ambientColor: color.
	glowMaterial diffuseColor: color.
	glowMaterial textureMode: GLModulate.
	glowMaterial cullFace: false.


	glowPointMaterial := TMaterial new.
	glowPointMaterial ambientColor: color.
	glowPointMaterial diffuseColor: color.
	glowPointMaterial textureMode: GLModulate.
	glowPointMaterial cullFace: false.

	1 to: 4 do:[ :i |
	glow := TTriangle new.
	glow v1: (Vector3 x:0 y: arrowLength z:0)
			   v2: (Vector3 x:radius*5 y: -0.1 z: 0)
			   v3: (Vector3 x:radius*-5 y: -0.1 z: 0).
	glow material: glowPointMaterial.
	glow rotationAroundY: 45.0 * i.
	point addChild: glow.

	glow := TRectangle new.
	glow extent: (radius*6)@(length - arrowLength).
	glow location: (Vector3 x:0 y: (length-arrowLength)/2.0 z:0.0).
	glow material: glowMaterial.
	glow rotationAroundY: 45.0 * i.
	shaft addChild: glow.].

	self solidTree: false.
	spell := nil.
	^self