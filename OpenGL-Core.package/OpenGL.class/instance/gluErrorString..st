Keyword API
gluErrorString: error
	"GLubyte* gluErrorString(GLenum error);"
	| explainedError |
	
	explainedError := error.

	(error = 1280) ifTrue: [ explainedError := 'invalid enum' ].
	(error = 1281) ifTrue: [ explainedError := 'invalid value' ].
	(error = 1282) ifTrue: [ explainedError := 'invalid operation' ].
	(error = 1283) ifTrue: [ explainedError := 'stack overflow' ].
	(error = 1284) ifTrue: [ explainedError := 'stack underflow' ].
	(error = 1285) ifTrue: [ explainedError := 'out of memory' ].

	^ 'gl error: ', explainedError