accessing
extentRect: extRect

	self extent: (extRect extent).
	self location: (extRect center - (extRect extent/2.0))@0.0.
