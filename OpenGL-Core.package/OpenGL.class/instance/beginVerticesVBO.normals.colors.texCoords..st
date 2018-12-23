rendering
beginVerticesVBO: vertices normals: vtxNormals colors: vtxColors texCoords: vtxTexCoords
	"this method accepts either the raw data or a bufferObjectID for each parameter"	

	vtxColors ifNotNil:[
		self glEnableClientState: GLColorArray.
		self glEnable: GLColorMaterial.

		(vtxColors isInteger) ifTrue: [
			self glBindBufferARB: GLArrayBufferARB with: vtxColors.
			self glColorPointer: 4 with: GLFloat with: 0 with: nil.
		]
		ifFalse: [ self glColorPointer: 4 with: GLFloat with: 0 with: vtxColors. ].
	].

	vtxNormals ifNotNil:[
		self glEnableClientState: GLNormalArray.

		(vtxNormals isInteger) ifTrue: [
			self glBindBufferARB: GLArrayBufferARB with: vtxNormals.
			self glNormalPointer: GLFloat with: 0 with: nil.
		] 	
		ifFalse: [ self glNormalPointer: GLFloat with: 0 with: vtxNormals. ].
	].

	vtxTexCoords ifNotNil:[
		self glEnableClientState: GLTextureCoordArray.

		(vtxTexCoords isInteger) ifTrue: [
			self glBindBufferARB: GLArrayBufferARB with: vtxTexCoords.
			self glTexCoordPointer: 2 with: GLFloat with: 0 with: nil. "$$ blah, assumes 2"
		]
		ifFalse: [ self glTexCoordPointer: 2 with: GLFloat with: 0 with: vtxTexCoords. ].
	].

	self glEnableClientState: GLVertexArray.

	(vertices isInteger) ifTrue: [
		self glBindBufferARB: GLArrayBufferARB with: vertices.
		self glVertexPointer: 3 with: GLFloat with: 0 with: nil.
	]
	ifFalse: [ self glVertexPointer: 3 with: GLFloat with: 0 with: vertices. ].
