accessing
recalculateFaceNormals: fcs
	"Are face normals going to be recalculated rather than used from the file?"

	^ (fcs < 1000).    "Was 200000, but calculations are quite slow."