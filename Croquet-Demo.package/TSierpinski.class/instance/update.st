initialize
update
	| sigma h v c d n1 n2 |
	" This method gets called when anything is changed."

	surface1 := IntegerArray ofSize: 3*(4 raisedTo: (depth-1)).
	surface2 := IntegerArray ofSize: 3*(4 raisedTo: (depth-1)).
	surface3 := IntegerArray ofSize: 3*(4 raisedTo: (depth-1)).
	surface4 := IntegerArray ofSize: 3*(4 raisedTo: (depth-1)).

	sigma := 0.
	1 to: depth do:[ :i | sigma := sigma + (4 raisedTo: i)].
	vertices := Vector3Array new: 4+(6*sigma).
	
	h := (1- (0.5*0.5))sqrt.
	c := (0.5*0.5)/h.
	v := (1- ((h-c)*(h-c)))sqrt.
	d := (c*v)/h.

	vertices at: 1 put: scale * (Vector3 x: -0.5 y: d negated z: c negated).
	vertices at: 2 put: scale * (Vector3 x: 0.5 y: d negated z: c negated).
	vertices at: 3 put: scale * (Vector3 x: 0.0 y: d negated z: h-c).
	vertices at: 4 put: scale * (Vector3 x: 0.0 y: v-d z: 0.0).

	vIndex := 5.
	sIndex := 1.
	self split: #(1 2 3 4) depth: depth.

	normals := Vector3Array new: 4.

	n1 := (vertices at: (surface1 at:2)) - (vertices at: (surface1 at: 1)).
	n2 := (vertices at: (surface1 at:3)) - (vertices at: (surface1 at: 1)).
	normals at: 1 put: ((n1 cross: n2) normalized).
	n1 := (vertices at: (surface2 at:2)) - (vertices at: (surface2 at: 1)).
	n2 := (vertices at: (surface2 at:3)) - (vertices at: (surface2 at: 1)).
	normals at: 2 put:  ((n1 cross: n2) normalized).
	n1 := (vertices at: (surface3 at:2)) - (vertices at: (surface3 at: 1)).
	n2 := (vertices at: (surface3 at:3)) - (vertices at: (surface3 at: 1)).
	normals at: 3 put:  ((n1 cross: n2) normalized).
	n1 := (vertices at: (surface4 at:2)) - (vertices at: (surface4 at: 1)).
	n2 := (vertices at: (surface4 at:3)) - (vertices at: (surface4 at: 1)).
	normals at: 4 put:  ((n1 cross: n2) normalized).
	boundSphere := TBoundSphere localPosition: (Vector3 x:0.0 y:0.0 z:0.0) radius: scale*(v-d).
	boundSphere frame: self.
	self boundsChanged.
	changed := false.