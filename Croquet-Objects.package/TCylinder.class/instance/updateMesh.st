initialize
updateMesh
	| halfPi slicePercentage sin cos stackPercentage radius ind stream |

	"For tex-coords to interpolate properly, the first/last vertices of each ring must be duplicates (with differing tex-coords)."
	vertexBuffer := Vector3Array ofSize: (slices+1)*stacks.
	normalBuffer := Vector3Array ofSize: (slices+1)*stacks.
	texCoordBuffer := Vector2Array ofSize: (slices+1)*stacks.

	"Compute geometry."
	halfPi := Float pi *2.0.
	1 to: slices+1 do: 
		[:sliceInd |
		slicePercentage := ((sliceInd-1) / slices) asFloat.
		sin := (slicePercentage*halfPi) sin.
		cos := (slicePercentage*halfPi) cos.
		1 to: stacks do: 
			[:stackInd |
			stackPercentage := ((stackInd-1)/(stacks-1)) asFloat.
			radius := baseRadius interpolateTo: topRadius at: stackPercentage.
			ind := (sliceInd-1)*stacks + stackInd.
			vertexBuffer at: ind put: (sin*radius)@(stackPercentage*height)@(cos*radius).
			normalBuffer at: ind put: sin@0@cos.
			texCoordBuffer at: ind put: (Vector2 u: slicePercentage v: stackPercentage)]].

	"Compute face groups"
	faceGroups := OrderedCollection new.
	0 to: stacks-2 do: 
		[:stackInd |
		faceGroups add: 1.  "material index"
		stream := WriteStream on: IntegerArray new.
		"stream nextPut: stackInd+1.
		stream nextPut: stackInd."
		0 to: slices do: 
			[:sliceInd |
			stream nextPut: (sliceInd*stacks)+stackInd+1.
			stream nextPut: (sliceInd*stacks)+stackInd].
		faceGroups add: stream contents].

	self faceGroups: faceGroups.  "init faceBuffers"

	"Compute cap face groups, if necessary."
	capFaceGroups := nil.
	capBase ifTrue: 
	[
		capFaceGroups := OrderedCollection new.
		capFaceGroups add: 1.
		stream := WriteStream on: IntegerArray new.
		slices to: 0 by: -1 do: [:sliceInd | stream nextPut: (sliceInd*stacks)].
		capFaceGroups add: stream contents.
	].
	capTop ifTrue:
	[
		capFaceGroups ifNil:[capFaceGroups := OrderedCollection new.].
		capFaceGroups add: 1.
		stream := WriteStream on: IntegerArray new.
		0 to: slices do: [:sliceInd | stream nextPut: (sliceInd*stacks)+stacks-1].
		capFaceGroups add: stream contents.
	].

	capNormals := nil.
	(capTop | capBase) ifTrue: [
		capNormals := normalBuffer copy.
		0 to: slices do: [ :index|
			capNormals at: (index*stacks+1) put: 0@-1@0.  "base"
			capNormals at: ((index*stacks)+stacks) put: 0@1@0.  "top"
		].
	].
	changed := false. 