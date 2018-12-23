transform
lookAt: frame up: u

	| at side m up |

"vector between frames in global coordinates"
	at := frame globalPosition - self globalPosition.
	at length = 0.0 ifTrue:[^ 0].
"remove my transform from the point"
	at:=frameParent orientation orthoNormInverse localPointToGlobal: at.
	at normalize.
	up := u.
	up ifNil:[
		at y abs = 1.0 ifFalse:[ up := Vector3 x: 0 y: 1 z: 0.] ifTrue:[
			up := Vector3 x:0 y:0 z:-1].].
	side := (at cross: up) normalized negated.
	up := (side cross: at) normalized negated.
	m := Matrix4x4 identity.
	m a11: side x.
	m a21: side y.
	m a31: side z.
	m a12: up x.
	m a22: up y.
	m a32: up z.
	m a13: at x.
	m a23: at y.
	m a33: at z.
	m translation: self translation.
	self localTransform: m.
