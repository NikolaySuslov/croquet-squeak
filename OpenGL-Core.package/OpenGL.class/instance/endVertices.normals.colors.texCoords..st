rendering
endVertices: vertices normals: vtxNormals colors: vtxColors texCoords: vtxTexCoords

	vtxColors ifNotNil:[self glDisableClientState: GLColorArray].
	vtxNormals ifNotNil:[self glDisableClientState: GLNormalArray].
	vtxTexCoords ifNotNil:[self glDisableClientState: GLTextureCoordArray].
	self glDisableClientState: GLVertexArray.
	self glDisableClientState: GLColorArray.
	self glDisable: GLColorMaterial.
