render
render: ogl cube: cube location: loc scale: scale
	| dx dy dz x y z e |

" This message is used only to make sure a frame is actually drawing something. In this case, I draw a cube. "
	e := cube extent.
	dx := e x*scale/2.0.
	dy := e y*scale/2.0.
	dz := e z*scale/2.0.
	x := loc x.
	y := loc y.
	z := loc z.

	ogl glBegin: GLQuads;
			glNormal3f: 0.0 with: 0.0 with: 1.0;
			glTexCoord2f:0.0 with:1.0;	glVertex3f: x+(dx negated) with: y+(dy negated) with: z+dz;
			glTexCoord2f:1.0 with:1.0;	glVertex3f: x+dx with: y+(dy negated) with: z+dz;
			glTexCoord2f:1.0 with:0.0;	glVertex3f: x+dx with: y+dy with: z+dz;
			glTexCoord2f:0.0 with: 0.0;	glVertex3f: x+(dx negated) with: y+dy with: z+dz.

		dz := dz negated.
		ogl glNormal3f: 0.0 with: 0.0 with: -1.0;
			glTexCoord2f:1.0 with: 0.0;	glVertex3f: x+(dx negated) with: y+dy with: z+dz;
			glTexCoord2f:0.0 with:0.0;	glVertex3f: x+dx with: y+dy with: z+dz;
			glTexCoord2f:0.0 with:1.0;	glVertex3f: x+dx with: y+(dy negated) with: z+dz;
			glTexCoord2f:1.0 with:1.0;	glVertex3f: x+(dx negated) with: y+(dy negated) with: z+dz.

		dz := dz negated.

		ogl glNormal3f: 1.0 with: 0.0 with: 0.0;
			glTexCoord2f:0.0 with:1.0;	glVertex3f: x+dx with: y+(dy negated) with: z+dz;
			glTexCoord2f:1.0 with:1.0;	glVertex3f: x+dx with: y+(dy negated) with: z+(dz negated);
			glTexCoord2f:1.0 with: 0.0;	glVertex3f: x+dx with: y+dy with: z+(dz negated);
			glTexCoord2f:0.0 with: 0.0;	glVertex3f: x+dx with: y+dy with: z+dz.
		dx := dx negated.

			ogl glNormal3f: -1.0 with: 0.0 with: 0.0;
			glTexCoord2f:1.0 with: 0.0;	glVertex3f: x+dx with: y+dy with: z+dz;
			glTexCoord2f:0.0 with:0.0;	glVertex3f: x+dx with: y+dy with: z+(dz negated);
			glTexCoord2f:0.0 with:1.0;	glVertex3f: x+dx with: y+(dy negated) with: z+(dz negated);
			glTexCoord2f:1.0 with:1.0;	glVertex3f: x+dx with: y+(dy negated) with: z+dz.
		dx := dx negated.

		ogl glNormal3f: 0.0 with: 1.0 with: 0.0;
			glTexCoord2f:1.0 with: 0.0;	glVertex3f: x+dx with: y+dy with: z+dz;
			glTexCoord2f:0.0 with:0.0;	glVertex3f: x+dx with: y+dy with: z+(dz negated);
			glTexCoord2f:0.0 with:1.0;	glVertex3f: x+(dx negated) with: y+dy with: z+(dz negated);
			glTexCoord2f:1.0 with:1.0;	glVertex3f: x+(dx negated) with: y+dy with: z+dz.

		dy := dy negated.

		ogl	glNormal3f: 0.0 with: -1.0 with: 0.0;
			glTexCoord2f:0.0 with:1.0;	glVertex3f: x+(dx negated) with: y+dy with: z+dz;
			glTexCoord2f:1.0 with:1.0;	glVertex3f: x+(dx negated) with: y+dy with: z+(dz negated);
			glTexCoord2f:1.0 with:0.0;	glVertex3f: x+dx with: y+dy with: z+(dz negated);
			glTexCoord2f:0.0 with: 0.0;	glVertex3f: x+dx with: y+dy with: z+dz.

	ogl glEnd.
