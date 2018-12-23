initialization
setup
	| postcard |
	harness := CroquetHarness new.
	harness addOverlay: self.
	postcard := TPostcard new routerAddress: nil "don't know what it is"
				id: nil "don't know what it is"
				name: 'Intro World' 
				viewpointName: #mainEntry.
	harness viewPortal future postcardLink: postcard.
	harness findViewpointByPostcard: postcard.
