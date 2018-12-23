initialize
initialize

	super initialize.
	path := OrderedCollection new.
	maxSize := 10000.
	bounds := TBoundSphere localPosition:(30@10@-120) radius: 10000.
	bounds frame: self.