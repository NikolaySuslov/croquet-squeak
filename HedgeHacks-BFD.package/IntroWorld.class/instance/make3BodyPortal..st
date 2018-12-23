initialize
make3BodyPortal: sp
	| win pc portal |
	win := self makePortal: 'Reed.bmp'.
	win translationX: -12 y: 0.0 z: -1.0.
	sp addChild: win.

	pc := TPostcard new routerAddress: nil "don't know what it is"
				id: T3BodyWorld islandID
				name: '3Body World'
				viewpointName: #IntroPortal.

	portal := win contents.
	portal postcardLink: pc.
	portal registerGlobal: #T3BodyPortal.