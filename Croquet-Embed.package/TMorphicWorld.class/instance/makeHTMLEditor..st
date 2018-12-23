initialize
makeHTMLEditor: uri

	"Demo support: open a Scamper instance,
	 revealing only its content window,
	 to serve as an editor for an HTML-coded text file.

	Usage is:   
		TEmbeddedApp name: #TMorphicWorld
						extent: xPixels@yPixels
						data: { #makeHTMLEditor: . 'local/path/to/file.html' }.

	"

	| class scamper absUrl window page |
	class := Smalltalk at: #Scamper ifAbsent: [
		^ nil.
	].

	scamper := class new.
	window := scamper morphicWindow.
	self makeWorld: window.
	page := window findA:WebPageMorph.
	world addMorphFront: page.
	page bounds: world bounds.
	window visible: false.

	absUrl := uri.
	(uri beginsWith: 'http://') ifFalse: [
		absUrl := (FileDirectory default url, uri).
	].
	scamper jumpToUrl: absUrl asUrl.

	^ scamper
	