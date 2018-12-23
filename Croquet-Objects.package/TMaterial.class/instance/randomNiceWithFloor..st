initialize
randomNiceWithFloor: floor

	| prg r g b |
	prg := Random new.


	self shininess: 1000000.0.
	self ambientColor:  #(0.1 0.1 0.1 1.0).
	self emissiveColor: #(0.0 0.0 0.0 1.0).

	r := prg next * (1.0 - floor) + floor.
	g := prg next * (1.0 - floor) + floor.
	b := prg next * (1.0 - floor) + floor.
	self diffuseColor:  {r.   g.   b.   1.0}.

	r := 1.0 - r.
	g := 1.0 - g.
	b := 1.0 - b.
	self specularColor: {r.   g.   b.   1.0}.
