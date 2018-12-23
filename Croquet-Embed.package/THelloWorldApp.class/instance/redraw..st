display
redraw: hilite
	"Redraw the app"
	| color font sz string form canvas |

	"Figure out the attributes to use for drawing"
	string := 'Hello Embedded World'.
	hilite 
		ifTrue:[color := Color red]
		ifFalse:[color := Color black].
	font := TextStyle defaultFont.
	sz := (font widthOfString: string) @ font height.

	"Draw actual content on the display's textureForm"
	form := self displayForm.
	canvas := form getCanvas.
	canvas fillRectangle: form boundingBox color: Color white.
	canvas drawString: string at: (extent - sz) // 2 font: font color: color.

	"And make sure we're up to date"
	self invalidate: form boundingBox.
	self forceDisplayUpdate
