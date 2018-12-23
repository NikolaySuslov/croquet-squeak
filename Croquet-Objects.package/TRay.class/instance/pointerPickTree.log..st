picking
pointerPickTree: frame log: stream

	"This is a debugging workalike of #pointerPickTree:frame 
	 that logs its search process to the given stream.  The TRay state,
	 and the boundSphere and pick result
	 for each descendant of the frame, are recorded."

	| |

	"Dump me, and then start the pick..."

	stream cr; nextPutAll: 'TRay:'; cr; nextPutAll: '----'.
	self class allInstVarNames do: [ :name|
		stream cr; nextPutAll: (name asString, ' = ', (self instVarNamed: name)).
	].

	stream cr; cr; nextPutAll: 'Pick trace:'; cr; nextPutAll:'----------'.

	^ self pointerPickTree1: frame log: stream.
