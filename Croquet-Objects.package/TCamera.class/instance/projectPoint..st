transform
projectPoint: aVector3
	"Project the given point into normalized device coordinates (-1, +1)"
	^self projectionMatrix localPointToGlobal:
		(self localTransform orthoNormInverse localPointToGlobal: aVector3)