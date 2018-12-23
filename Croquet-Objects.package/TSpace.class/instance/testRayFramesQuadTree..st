render
testRayFramesQuadTree: qt
	testRays ifTrue:[ rayFrames do:[ :rf | (rf automatic and:[rf downRay]) ifTrue: [
		rf currentFrame: qt.
		qt quadPickFloor: rf location: rf globalPosition ].].].