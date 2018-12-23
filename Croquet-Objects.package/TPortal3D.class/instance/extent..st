accessing
extent: ext

	| clip clipN |
	clip := ext x/2.0.
	clipN := clip negated.
	self translation:( Vector3 x:0 y:0 z:0 ).
	clipBox := TBox min: (Vector3 x:clipN y:clipN z:clipN) max: (Vector3 x:clip y: clip z: clip).
	cube extent: clipBox extent.
	