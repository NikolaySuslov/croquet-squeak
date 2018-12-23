accessing
flipZ
	"Flip the z coordinate"
	vertices do:[:vtx| vtx z: 0.0 - vtx z].
	vtxNormals do:[:nrm| nrm z: 0.0 - nrm z].
