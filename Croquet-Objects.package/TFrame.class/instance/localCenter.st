transform
localCenter

	"Return a translation to the visual center of this object.
     By default, this is just the local translation.
     This is the basis of various Go-To operations,
     so objects whose visual center is different from the frame origin
     may override this."

	^ self translation