initialize
initialize
	| light space tframe win pc portal |
	Processor activeIsland id: self class islandID.
	space := TSpace new.
	space color:  (VectorColor r: 0.0 g: 0.0 b: 0.0 a: 1.0).

	space registerGlobal: #mainEntry.

	light := TLight new.
	light ambientColor: #(0.3 0.3 0.3 1).
	light translationX: -10 y:0.0 z: 0.0.
	light rotationAroundX: -90.
	space addChild: light.

	tframe := T3BodyDemo new.
	space addChild: tframe.

	win := self makePortal: nil.
	win rotationAroundY: 225.
	win translationX: 40.0 y:10.0 z: 40.0.
	win openContents.
	pc := TPostcard new routerAddress: nil "don't know what it is"
				id: IntroWorld islandID
				name: 'Intro World'
				viewpointName: #T3BodyPortal.

	portal := win contents.
	portal postcardLink: pc.
	portal registerGlobal: #IntroPortal.
	space addChild: win.