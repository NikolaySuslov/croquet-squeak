project
gluPerspective: aFOVY aspect: aAspect zNear: aZNear zFar: aZFar

| m sine cotangent deltaZ radians |

m := Matrix4x4 identity.

radians := (aFOVY/2.0)*(Float pi/180.0).
sine := radians sin.
deltaZ := aZFar - aZNear.
cotangent := radians cos/sine.
m a11: cotangent/aAspect.
m a22: cotangent.
m a33: ((aZFar + aZNear) negated)/deltaZ.
m a34: -1.
m a43: -2 * aZNear * aZFar / deltaZ.
m a44: 0.
self glMultMatrixf: m.



"void GLAPIENTRY
gluPerspective(GLdouble fovy, GLdouble aspect, GLdouble zNear, GLdouble zFar)

{
    
	GLdouble m[4][4];
    	double sine, cotangent, deltaZ;
    	double radians = fovy / 2 * :=:=glPi / 180;

    
	deltaZ = zFar - zNear;
    	sine = sin(radians);
    	if ((deltaZ == 0) || (sine == 0) || (aspect == 0)) 
	{
	return;
    }
    	cotangent = COS(radians) / sine;
	:=:=gluMakeIdentityd(&m[0][0]);
    	m[0][0] = cotangent / aspect;
    	m[1][1] = cotangent;
    	m[2][2] = -(zFar + zNear) / deltaZ;
    	m[2][3] = -1;
    	m[3][2] = -2 * zNear * zFar / deltaZ;
    	m[3][3] = 0;
    	glMultMatrixd(&m[0][0]);
}"