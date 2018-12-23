accessing
lockStep
" force the camera to follow the avatar"
	| rval |
	rval := lockStep or:[lockLockStep].
	lockStep := false.
	^ rval.