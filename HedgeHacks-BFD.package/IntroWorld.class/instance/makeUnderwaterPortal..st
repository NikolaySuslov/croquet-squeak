initialize
makeUnderwaterPortal: sp
	| win pc portal |
	win := self makePortal: 'Raab.bmp'.
	win translationX: -5 y: 0.0 z: -2.0.
	sp addChild: win.

	pc := TPostcard new routerAddress: nil "don't know what it is"
				id: UnderwaterWorld islandID
				name: 'Underwater World'
				viewpointName: #IntroPortal.
	portal := win contents.
	portal postcardLink: pc.
	portal registerGlobal: #UnderwaterPortal.