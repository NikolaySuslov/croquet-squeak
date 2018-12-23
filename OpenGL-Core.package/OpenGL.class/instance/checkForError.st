debugging
checkForError
	"Check for any OpenGL errors, and raise an Error if any exist."
	| error |

	error := self glGetError.
	(error ~= GLNoError) ifTrue: [self error: error printString]
