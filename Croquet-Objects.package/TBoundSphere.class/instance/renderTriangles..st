render
renderTriangles: ogl


	| index triList v0 v1 v2 |
	vertices ifNil:[ children ifNotNil:[ children do:[:c |c renderTriangles:ogl.]]]
	ifNotNil:[
		index := 0.
		triList := children.
		[index < triList size] whileTrue:[
			v0 := vertices at: (triList at: (index := index+1))+1.
			v1 := vertices at: (triList at: (index := index+1))+1.
			v2 := vertices at: (triList at: (index := index+1))+1.
v0:=v0+(0@1@0).
v1:=v1+(0@1@0).
v2:=v2+(0@1@0).

			ogl
				glBegin: GLTriangles;
					glVertex3fv: v0;
					glVertex3fv: v1;
					glVertex3fv: v2;
				glEnd.
		].
	].
