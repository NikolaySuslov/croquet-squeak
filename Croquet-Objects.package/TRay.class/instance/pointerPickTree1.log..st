picking
pointerPickTree1: frame log: stream

	"This is a the recursive worker method for pointerPickTree:log:,
	 call that instead.   This is a workalike of pointerPickTree:frame,
	 with exhaustive logging of the pick search."

	| rval trans bs |

	frame = excludeFrame ifTrue: [
		stream cr; nextPutAll: ' Skipped excluded ', frame class, ' ', frame objectID.
		^ false.
	].

	rval := false.
	trans := self selectedCameraTransform.
	bs := frame boundSphere.

	frame visible ifTrue:[(self pointerPick: bs) ifTrue:[ rval := true].].
	(frame visible) ifTrue: [
		(bs isNil) ifTrue: [
			stream cr; 
				nextPutAll: 'NIL boundSphere in ', frame class, ' ', frame objectID, ' in ', frame parent.
		] ifFalse: [
			stream cr; 
				nextPutAll: '', frame class, ' ', frame objectID, ' bS=', (bs radius), '@' ,(bs globalPosition), ' hit ? ', rval.
		]
	] ifFalse: [
		stream cr; nextPutAll: ' Skipped invisible ', frame class, ' ', frame objectID.
	].

	frame frameChildren ifNotNil:[
		frame frameChildren do:[ :fc | (self pointerPickTree1: fc log: stream) ifTrue:[rval := true.].].].
	self selectedCameraTransform: trans.
	^ rval.