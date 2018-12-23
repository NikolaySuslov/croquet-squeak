accessing
e1: edge1 e2: edge2 e3: edge3
	flags := 0.
	e1 := edge1.
	e2 := edge2.
	e3 := edge3.
	e1 rightFace: self. e1 symmetric leftFace: self.
	e2 rightFace: self. e2 symmetric leftFace: self.
	e3 rightFace: self. e3 symmetric leftFace: self.
