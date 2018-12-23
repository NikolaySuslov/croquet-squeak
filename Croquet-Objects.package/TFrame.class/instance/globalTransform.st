transform
globalTransform
	" This is the global transform of the frame - its location and orientation in global world coordinates. We only
	calculate this when we have to, which is only when a local coordinate frame has been changed AND when someone 	asks for it. "

	frameChanged ifTrue:[	
		frameParent ifNotNil: [ self globalTransform: 
			((frameParent globalTransform) * self localTransform)] ifNil:[
		self globalTransform:  self localTransform.].
	].
	^ globalTransform.
" NOT ^ self globalTransform - this causes bad recursion error!"
					 
