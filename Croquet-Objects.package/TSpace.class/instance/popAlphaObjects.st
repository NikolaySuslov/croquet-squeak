render
popAlphaObjects
	"restore alpha objects saved while recursively rendering (in TPortal3D)"
	alphaObjects := savedAlphaObjects removeLast.
	