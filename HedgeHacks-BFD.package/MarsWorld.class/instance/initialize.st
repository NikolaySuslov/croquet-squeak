as yet unclassified
initialize
	| space light mesh rover win pc portal |
	Processor activeIsland id: self class islandID.
	space := TSpace new.
	space registerGlobal: #mainEntry.
	space color:(VectorColor r: 0.6 g: 0.5 b: 0.2 a: 1.0).

	light := TLight new.
	light rotationAroundZ: 120.
	light addRotationAroundY:2.
	light translationX: 10 y: 0 z:10.

	space addChild: light.

	rover := TRover new.
	rover translationX:10 y:-19.11 z:0.
	space addChild: rover.

	mesh := (TLoad3DSMax new initializeWithFileName: (FileDirectory pathFromURI: 'Content/Mars/masterTerrain.ASE') scale: 0.05) frame.
	mesh boundsDepth: 2.
	mesh initBounds.
	mesh translationX: 0.0 y: 22.0 z:0.0.
	TQuadTree new initializeWithSpace: space frame: mesh.

	win := self makePortal: nil.
	win rotationAroundY: 225.
	win translationX: 40.0 y:-17.0 z: 40.0.
	win openContents.
	pc := TPostcard new routerAddress: nil "don't know what it is"
				id: IntroWorld islandID
				name: 'Intro World'
				viewpointName: #MarsPortal.

	portal := win contents.
	portal postcardLink: pc.
	portal registerGlobal: #IntroPortal.
	space addChild: win.