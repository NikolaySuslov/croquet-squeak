initialize
initFrustum: angle bounds: bounds zNear: nVal zFar: fVal

	| aspect |
	aspect := (bounds width/bounds height) asFloat.
  	self glMatrixMode: GLProjection.
  	self glLoadIdentity.
	self gluPerspective:angle aspect: aspect zNear: nVal zFar: fVal.
  	self glMatrixMode: GLModelview.
  	self glLoadIdentity.
  	self glViewport:bounds left with:bounds top with: bounds width with: bounds height.
