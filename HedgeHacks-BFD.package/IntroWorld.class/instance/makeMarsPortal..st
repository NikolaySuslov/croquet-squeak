initialize
makeMarsPortal: sp
	| win pc portal |
	win := self makePortal: 'McCahill.bmp'.
	win translationX: -20 y: 0.0 z: 0.0.
	sp addChild: win.
	pc := TPostcard new routerAddress: nil "don't know what it is"
				id: MarsWorld islandID
				name: 'Mars'
				viewpointName: #IntroPortal.
	portal := win contents.
	portal postcardLink: pc.
	portal registerGlobal: #MarsPortal.