accessing
transformBy: aMatrix
	"Modify the mesh by transforming it using a matrix; this allows us to change the insertion point of the mesh"
	vertices := vertices clone.
	vertices do:[:vtx| vtx loadFrom: (aMatrix localPointToGlobal: vtx)].
	vtxNormals := vtxNormals clone.
	vtxNormals do:[:vtx| vtx loadFrom: (aMatrix localDirToGlobal: vtx)].