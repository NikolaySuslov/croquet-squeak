project
gluLookAtEyeX: eyex aEyeY: eyey aEyeZ: eyez aCenterX: centerx aCenterY: centery aCenterZ: centerz aUpX: upx aUpY: upy aUpZ: upz

 	| forward up side m |
	forward := Vector3 x: centerx - eyex 
						  y: centery - eyey
						  z: centerz - eyez.
	forward normalize.
	up := Vector3 x: upx y: upy z: upz.
	side := (forward cross: up) normalized.
	up := (side cross: forward) normalized.
	m := Matrix4x4 identity.
	m a11: side x.
	m a21: side y.
	m a31: side z.
	m a12: up x.
	m a22: up y.
	m a32: up z.
	m a13: forward x negated.
	m a23: forward y negated.
	m a33: forward z negated.

	self glMultMatrixf m.
	self glTranslated: eyex negated with: eyey  negated with: eyez negated.

"void GLAPIENTRY
gluLookAt(GLdouble eyex, GLdouble eyey, GLdouble eyez, GLdouble centerx,
	  GLdouble centery, GLdouble centerz, GLdouble upx, GLdouble upy,
	  GLdouble upz)
{
    
	int i;
    
	float forward[3], 
	side[3], up[3];
    
	GLfloat m[4][4];

    

	forward[0] = centerx - eyex;
    
	forward[1] = centery - eyey;
    
	forward[2] = centerz - eyez;

    
	up[0] = upx;
    
	up[1] = upy;
    
	up[2] = upz;

    
	normalize(forward);

    
/* Side = forward x up */
    
	cross(forward, up, side);
    
	normalize(side);

    
/* Recompute up as: up = side x forward */
    
	cross(side, forward, up);

    
	:=:=gluMakeIdentityf(&m[0][0]);
    
	m[0][0] = side[0];
    
	m[1][0] = side[1];
    
	m[2][0] = side[2];

    
	m[0][1] = up[0];
    
	m[1][1] = up[1];
    
	m[2][1] = up[2];

    
	m[0][2] = -forward[0];
    
	m[1][2] = -forward[1];
    
	m[2][2] = -forward[2];

    
	glMultMatrixf(&m[0][0]);
    
	glTranslated(-eyex, -eyey, -eyez);

}
"