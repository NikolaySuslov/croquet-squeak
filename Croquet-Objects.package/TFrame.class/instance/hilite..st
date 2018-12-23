accessing
hilite: aColor
	"Hilight this frame and its children with a default hilite color.
	 The effect lasts until the state is cleared with 'frame unhilite.' "

	aColor ifNil: [ 
		self unhilite.			"self hilite:nil == self unhilite."
	] ifNotNil: [
	 	hiliteColor := aColor asVectorColor
	].