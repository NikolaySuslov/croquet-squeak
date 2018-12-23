initialize
initClipPlanes

	| aspect |
	aspect := self aspect. 
	length := 1.0/(((viewAngle/2.0)*(Float pi/180.0))tan). 

	clipPlanes := Vector3Array ofSize: 4.
	
	clipPlanes at: 1 put: (Vector3 x: 0.0 y: length  z: 1)normalize negated.
	clipPlanes at: 2 put: (Vector3 x: 0.0 y: length negated z: 1)normalize negated.
	clipPlanes at: 3 put: (Vector3 x: length y:0.0 z: aspect)normalize negated.
	clipPlanes at: 4 put: (Vector3 x: length negated y:0.0 z: aspect)normalize negated.