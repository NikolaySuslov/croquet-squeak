TMesh
Almost all simple arrays are 0 based when indexed by other arrays. Not the materialList.

materialList - this is an OrderedCollection of materials that are used in the mesh. This is what the first element of the faceGroups refers to. This must always be a list.
alias - you can ignore this for now. It is important when we start doing mesh based transforms, because it tells you where the aliased vertices are.
vertices - 0 index based list of 3D vertices.
vtxNormals - the normal 3D vector for the given vertex.
alpha - checks the materials referenced by the facegroups for alpha values. Calculated for you based upon the materialList.
opaque  - same as alpha, but inverted.
textureUV - the 2D u,v coordinates of the texture at the associated vertex.
faceGroups - an array of materialList index (indexing starting at 1), and vertex face index arrays (index starting at 0). These are simply interleaved. 
boundsChanged - calculated for you at construction time. 
boundSphere - calculated for you.
boundsDepth - part of construction and used to determine the depth of the hierarchy.
boundMaterial - only used if you need to see the bound spheres or bound cubes.

These are the analogs to the equivalent TPrimitives. There are two sets because a TMesh may have some materials that have alpha components and some that don't. These are rendered at different times, so they need separate display lists.

materialList - the list of materials used by the different face sets
vertices - the vertices of the mesh
alias - aliased vertex sets
vtxNormals - normals at each vertex
textureUV - the texture uv location at each vertex
faceGroups - collection of face groups (a face group is an ordered list of indices into the vertex arrays)
alpha - flag indicates if this mesh has any alpha values
opaque - flag indicates if mesh has no alpha values
boundsChanged - indicates the boundaries of the mesh have changed
boundSphere - the bounding sphere of the mesh, typically a hierarchy
boundsDepth - depth of the bound sphere hierarchy
boundMaterial - material to render the bound spheres with
cachingEnabled - currently not used, but specifies the OpenGL caching
cachingAlphaEnabled - ""

DAS