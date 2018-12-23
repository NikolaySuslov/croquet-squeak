actions
killWindow
	frameParent removeChild: self.
	contents ifNotNil:[contents := nil].