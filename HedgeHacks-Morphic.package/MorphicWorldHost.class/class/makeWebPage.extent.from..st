instance creation
makeWebPage: url extent: worldExtent from: tform
	| host world scamper window page absUrl |
	host := self new initializeWithMorph: nil thumb: tform extent: worldExtent.
	world := host world.
	Smalltalk at: #Scamper ifPresent:[:aClass| 
		scamper := aClass new.
		window := scamper morphicWindow.
		world addMorph: window.
		page := window findA: WebPageMorph. "heh, heh"
		world addMorphFront: page.
		page bounds: world bounds.
		window visible: false.

		absUrl := url.
		(url beginsWith: 'http://') ifFalse: [
			absUrl := (FileDirectory default url, url).
		].
		scamper jumpToUrl: absUrl asUrl.
	].
	host redraw.
	TMorphicForm registerHost: host.