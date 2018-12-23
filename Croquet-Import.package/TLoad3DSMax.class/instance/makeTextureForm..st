parse
makeTextureForm: subtree

	| field fname start end stream node |

	"Create a Form from the BITMAP named in the given subtree."

	node := subtree detect: [:n| n name = #TBitmap ] ifNone: [ nil ].

	node ifNil: [^ nil].

	field := node value.
	start := field findDelimiters:'"' startingAt: 1.
	end := field findDelimiters: '"' startingAt: start+1.
	fname := field copyFrom: start+1 to: end-1.

	fname ifNil:[^ nil].
	fname size = 0 ifTrue:[^ nil].

	"get file name from full path name - assumes file is a Windows or Unix file name"
	fname := fname reverse.
	end := fname findDelimiters:'\:/'startingAt: 1.
	fname := (fname copyFrom: 1 to: end-1) reverse.

	fname ifNil:[^fname].

	[
		stream := filePath readOnlyFileNamed: (filePath pathFromURI: fname).
	     [ ^ fname -> (Form fromBinaryStream: stream) ] ensure: [ stream close. ].
	] on: Error do: [ :error|
		Transcript cr; show: 'ASE Loader cannot read texture ', fname, ': ', error description.
	].
	^nil

	


	