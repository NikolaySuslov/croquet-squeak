frameManagement
forceGlobalToLocal

"This is used by TMesh when the imported vertices are pre-transformed, and all of the nodes are in global coordinates and we want to put them back into their untransformed state. This occurs with the 3DS Max ASE files."

	frameChildren ifNotNil:[ frameChildren do:[ :fc | fc forceGlobalToLocal.]].
	frameParent ifNotNil:[
		self localTransform: (
			frameParent localTransform orthoNormInverse * self localTransform).
		].