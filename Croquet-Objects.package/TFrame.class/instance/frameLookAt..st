transform
frameLookAt: frame

" used to put my lookAt vector into the frame of the argument"
	^ frame inverseGlobalOrientation localPointToGlobal: self lookAt negated.
