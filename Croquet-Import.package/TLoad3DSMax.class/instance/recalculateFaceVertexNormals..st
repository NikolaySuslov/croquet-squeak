accessing
recalculateFaceVertexNormals: fcs
	"are vertex normals going to be recalculated rather than being used from the file?"

	^ (fcs < 500).		"Was 20000, but calculation is very slow."