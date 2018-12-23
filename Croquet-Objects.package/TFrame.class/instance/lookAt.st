accessing
lookAt

	"Return a normalized global-space vector pointing along the orientation of this frame."

	^ self globalTransform column3 normalized.