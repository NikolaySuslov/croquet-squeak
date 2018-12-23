importing
importTForm
	| extent fileName bMM bSF ext form pngStream pngForm |
	fileName := self importNext.
	extent := self importNext.
	bMM := self importNext.
	bSF := self importNext.
	ext := self importNext.
	archive ifNil:[
		pngForm := Form extent: extent depth: 32.
		pngForm fillWhite.
	] ifNotNil:[
		progressBar ifNotNil:[progressBar value: 'Loading ', fileName].
		pngStream := (archive memberNamed: fileName) contentStream binary.
		pngForm := (PNGReadWriter on: pngStream) nextImage.
	].
	form := TForm new initialize: fileName form: pngForm mipmap: bMM shrinkFit: bSF extension: ext.
	^form
