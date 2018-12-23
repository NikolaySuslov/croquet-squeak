initialize
checkAlpha
	changed ifTrue: [self updateMesh].	"ensure that we have 'faceGroups' to check"
	super checkAlpha.