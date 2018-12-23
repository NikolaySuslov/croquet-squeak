geometry
extent: newExtent
	super extent: newExtent.
	scroller position: self position + (self extent - scroller extent // 2).