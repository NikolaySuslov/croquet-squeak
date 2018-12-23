parsing
fixTransformsIn: anActor
	"Traverse anActor and all its children checking for non-orthonormal transforms.
	Move these down until we get to the leaves and there transform the meshes (if any)."
	| tfm offset rowX rowY rowZ scaleX scaleY scaleZ scale |
	tfm := anActor localTransform copy.
	"Check if the transform is *really* weird"
	(tfm a41 = 0.0 and:[tfm a42 = 0.0 and:[tfm a43 = 0.0 and:[tfm a44 = 1.0]]]) ifFalse:[
		self error: 'Cannot fix transform'.
	].

	"Remember offset of the transform"
	offset := tfm translation.
	tfm translation: 0@0@0.

	"Compute unit vectors to see if their length changes"
	rowX := tfm localPointToGlobal: 1@0@0.
	rowY := tfm localPointToGlobal: 0@1@0.
	rowZ := tfm localPointToGlobal: 0@0@1.

	"Normalize"
	scaleX := 1.0 / rowX length.	rowX *= scaleX.
	scaleY := 1.0 / rowY length.	rowY *= scaleY.
	scaleZ := 1.0 / rowZ length.	rowZ *= scaleZ.

	"Orthogonalize (later...)"
	(rowX dot: rowY) < 0.01 ifFalse:[self error: 'Not orthogonal'].
	(rowY dot: rowZ) < 0.01 ifFalse:[self error: 'Not orthogonal'].
	(rowZ dot: rowX) < 0.01 ifFalse:[self error: 'Not orthogonal'].

	"Create new orthonormal transform"
	tfm := Matrix4x4 identity.
	tfm a11: rowX x; a12: rowX y; a13: rowX z.
	tfm a21: rowY x; a22: rowY y; a23: rowY z.
	tfm a31: rowZ x; a32: rowZ y; a33: rowZ z.
	tfm translation: offset.
	anActor localTransform: tfm.

	"See if this a mesh"
	(anActor isKindOf: TMesh) ifTrue:[
		"Then rescale its vertices"
		scale := scaleX@scaleY@scaleZ negated.
		anActor vertices: (anActor vertices collect:[:vtx| vtx * scale]).
		anActor normals: (anActor normals collect:[:vtx| vtx x @ vtx y @ vtx z negated]).
		"And compute the bound spheres"
		anActor initBounds.
	].

	"Scale children (using a matrix since we'll orthonormalize them later) and recurse"
	scale := Matrix4x4 withScale: scaleX@scaleY@scaleZ.
	anActor frameChildren ifNotNil:[
		anActor frameChildren do:[:child|
			child translation: child translation x negated@ child translation y @ child translation z negated.
			child localTransform: (scale composeWith: child localTransform).
			self fixTransformsIn: child.
		].
	].
