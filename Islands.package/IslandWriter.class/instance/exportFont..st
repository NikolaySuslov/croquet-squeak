export
exportFont: aFont
	"Export a font"
	dataStream nextPut: CodeFont.
	self export: aFont familyName.
	self export: aFont height.
	self export: aFont emphasis.
