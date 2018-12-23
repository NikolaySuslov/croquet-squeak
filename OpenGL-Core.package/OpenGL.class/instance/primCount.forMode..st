private
primCount: indexCount forMode: mode

	mode == GLTriangles ifTrue: [^ indexCount // 3].
	mode == GLQuads ifTrue: [^ indexCount // 4].
	mode == GLPoints ifTrue: [^ indexCount].
	mode == GLTriangleStrip ifTrue: [^ indexCount - 2].
	mode == GLTriangleFan ifTrue: [^ indexCount - 2].
	mode == GLLineStrip ifTrue: [^ indexCount - 1].
	mode == GLLines ifTrue: [^indexCount // 2].
	mode == GLPolygon ifTrue:[^1].
	mode == GLLineLoop ifTrue:[^1].

	"It's easy to add additional modes if necessary."
	self error: 'Unexpected mode'.
	^ 0