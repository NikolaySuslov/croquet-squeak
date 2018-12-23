enumerating
triangleVerticesDo: aBlock
	"Like triangleFacesDo: - just passes the vertices directly (instead of vertex index)"
	self triangleFacesDo:[:fA :fB :fC|
		aBlock value: (vertexBuffer at: 1+fA)
				value: (vertexBuffer at: 1+fB)
				value: (vertexBuffer at: 1+fC).
	].