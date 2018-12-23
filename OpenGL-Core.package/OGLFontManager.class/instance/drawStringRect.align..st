displaying
drawStringRect: rect align: aSymbol
	| offset extent |
	aSymbol ifNotNil:[
		offset := (rect perform: aSymbol).
		glx glBitmap: 0 with: 0 with: 0 with: 0
			with: rect left - offset x
			with: offset y - rect height
			with: nil.
	].
	extent := rect extent.
	glx glBitmap: extent x with: extent y with: 0 with: 0
			with: extent x
			with: extent y
			with: ((Form extent: extent depth: 1) bits atAllPut: 16rFFFFFFFF).
