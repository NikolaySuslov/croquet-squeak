displaying
frameStringRect: rect align: aSymbol
	| offset form extent |
	aSymbol ifNotNil:[
		offset := (rect perform: aSymbol).
		glx glBitmap: 0 with: 0 with: 0 with: 0
			with: rect left - offset x
			with: offset y - rect height
			with: nil.
	].
	extent := rect extent.
	form := (Form extent: extent depth: 1).
	form getCanvas frameRectangle: form boundingBox width: 1 color: Color black.
	form flipVertically.
	self swapBytesOf: form bits.
	glx glBitmap: extent x with: extent y with: 0 with: 0
			with: extent x
			with: extent y
			with: form bits.
