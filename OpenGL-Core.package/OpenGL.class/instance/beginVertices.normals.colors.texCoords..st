rendering
beginVertices: vertices normals: vtxNormals colors: vtxColors texCoords: vtxTexCoords
	| size |

	vtxColors ifNotNil:[
		self glEnableClientState: GLColorArray.
		self glEnable: GLColorMaterial.
		self glColorPointer: 4 with: GLFloat with: 16 with: vtxColors.
	].
	vtxNormals ifNotNil:[
		self glEnableClientState: GLNormalArray.
		self glNormalPointer: GLFloat with: 12 with: vtxNormals.
	].
	vtxTexCoords ifNotNil:[
		size := vtxTexCoords contentsSize.
		self glEnableClientState: GLTextureCoordArray.
		self glTexCoordPointer: size with: GLFloat with: size*4 with: vtxTexCoords.
	].
	self glEnableClientState: GLVertexArray.
	self glVertexPointer: 3 with: GLFloat with: 12 with: vertices.
