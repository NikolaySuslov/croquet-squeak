project
checkForErrors
	| glerror |

	glerror := self glGetError.
	
	(glerror ~= GLNoError) 
		ifTrue: [ Transcript show: (self gluErrorString: glerror); cr ].