render
renderSurface: ogl

	| mid |
	children ifNotNil:[
		normal ifNil: [ children do:[ :c | c renderSurface: ogl. ].].].
	normal ifNotNil:[
	 		ogl glColor3fv: #(1.0 0 0)asFloatArray.
			ogl glBegin: GLLineStrip.
    
			ogl glVertex3fv:localPosition + (normal*offset) + normal.
			ogl glVertex3fv:localPosition + (normal * offset).
			ogl glVertex3fv:localPosition + (normal*offset) + (up*radius).
		mid := (up+side) normalized.
			ogl glVertex3fv:localPosition + (normal*offset) + (mid*radius).		
			ogl glVertex3fv:localPosition + (normal*offset) + (side*radius).
		mid := (side - up) normalized.
			ogl glVertex3fv:localPosition + (normal*offset) + (mid*radius).		
			ogl glVertex3fv:localPosition + (normal*offset) + (up*radius negated).
		mid :=( side+up)normalized negated.
			ogl glVertex3fv:localPosition + (normal*offset) + (mid*radius).		
			ogl glVertex3fv:localPosition + (normal*offset) + (side*radius negated).
		mid := (up-side)normalized.
			ogl glVertex3fv:localPosition + (normal*offset) + (mid*radius).		
			ogl glVertex3fv:localPosition + (normal*offset) + (up*radius).
		ogl glEnd.].
