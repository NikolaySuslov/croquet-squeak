initialize
makeQwaqPortalRemote: sp using: qwaqWorld

	| win pc portal |
	win := self makePortal: 'helicopter.bmp'.
	win translationX: -20 y: 0.0 z: 30.0.
	win rotationAroundY: 180.
	sp addChild: win.

	pc := TPostcard new routerAddress: nil "don't know what it is"
				id: qwaqWorld islandID
				name: 'Qwaq Conferencing (DC)'
				viewpointName: #IntroPortal.
	portal := win contents.
	portal postcardLink: pc.
	portal registerGlobal: #QwaqPortalRemote.