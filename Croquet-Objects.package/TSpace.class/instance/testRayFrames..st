render
testRayFrames: bs

	rayFrames do:[ :rf | rf automatic ifTrue:[rf pick: bs.].].