render
pushAlphaObjects
	"temporarily save alpha objects while recursively rendering (in TPortal3D)"
	savedAlphaObjects add: alphaObjects.
	alphaObjects := OrderedCollection new: 0.
	