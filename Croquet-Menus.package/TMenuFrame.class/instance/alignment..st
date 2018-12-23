accessing
alignment: aSymbol
	"Set the alignment of this menu:
		#topLeft, #topCenter, #topRight
		#leftCenter, #center, #rightCenter
		#bottomLeft, #bottomCenter, #bottomRight
	"
	alignment := aSymbol.
	self changed.