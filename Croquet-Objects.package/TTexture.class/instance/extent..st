accessing
extent: ext

	super extent: ext.
	baseScale := (extent x/tform extent x) asFloat.