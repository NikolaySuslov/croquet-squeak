palette handling
cancelPainting: aPaintBoxMorph evt: evt
	"Undo the operation after user issued #cancel in aPaintBoxMorph"
	self cancel.