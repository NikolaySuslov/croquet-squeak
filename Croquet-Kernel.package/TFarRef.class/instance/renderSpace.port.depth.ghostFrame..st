future sends
renderSpace: ogl port: portal depth: depth ghostFrame: ghost

	^ self send:[ :sp | sp renderSpace: ogl port: portal depth: depth ghostFrame: ghost.].
