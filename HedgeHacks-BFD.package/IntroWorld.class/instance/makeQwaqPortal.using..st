initialize
makeQwaqPortal: sp using: qwaqWorld

	"This portal will be an unresolved mirror in the general hedgehog world."
	| win pc portal |
	win := self makePortal: 'helicopter.bmp'.
	win translationX: -24 y: 0.0 z: 12.0.
	win rotationAroundY: 90.
	win openContents.
	sp addChild: win.

	pc := TPostcard new routerAddress: nil "don't know what it is"
				id: nil
				name: 'Qwaq Conferencing'
				viewpointName: #IntroPortal.
	portal := win contents.
	portal postcardLink: pc.
	portal registerGlobal: #QwaqPortal.