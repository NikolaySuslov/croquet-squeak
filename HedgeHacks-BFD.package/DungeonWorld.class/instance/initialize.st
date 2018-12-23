initialize
initialize
	| lt space spinner sky mesh win pc portal waterTop waterfall waterBottom |
	Processor activeIsland id: self class islandID.
	space := TSpace new.
	space registerGlobal: #mainEntry.

	space color:(VectorColor r: 0.5 g: 0.7 b: 0.6 a: 1.0).
	space fogOn: true.
	space fogDensity: 0.0015.
	space fogStart: 100.0.
	space fogEnd: 6000.0.

	lt := TLight new.
	lt ambientColor: #(1 1 1 1).
	lt diffuseColor: #(1 1 1 1).
	lt specularColor: #(0.2 0.15 0.15 1.0).
	lt visible: false.

	spinner := TSpinner new.
	spinner translationX: -10 y:0.0 z: 0.0.
	spinner matNil.
	spinner contents: lt.
	spinner addRotationAroundZ: 120.
	spinner addRotationAroundY:-10.
	spinner translationX: -30 y:-32 z: -76.

	space addChild: spinner. " add the light"

	sky := TSkyBox new initializeWithFileName: 'CA'.
	sky step. "get going"
	space addChild: sky.

	mesh := (TLoad3DSMax new initializeWithFileName: 
		(FileDirectory pathFromURI: 'Content/DungeonDemo/space5.ASE') 
		scale: 0.035 shadeAngle: 90.1 textureMode: GLModulate) frame.
	mesh translationX: -67 y: -3.0 z:-208.0.
	mesh boundsDepth: 3.
	mesh initBounds.

	waterTop := (mesh find:[:frm | frm objectName = '$WaterfallTop'])at:1.
	waterfall := self makeWaterfall: waterTop translation.
	waterTop parent addChild: waterfall.
	waterTop removeSelf.
	waterBottom := (mesh find:[:frm | frm objectName = '$WaterfallBottom'])at:1.
	waterfall := self makeWaterfallBottom: waterBottom translation.
	waterBottom parent addChild: waterfall.
	waterBottom removeSelf.

	TQuadTree new initializeWithSpace: space frame: mesh.

	win := self makePortal: nil.
	win translationX: -5 y: -32 z: -78.
	win openContents.
	pc := TPostcard new routerAddress: nil "don't know what it is"
				id: IntroWorld islandID
				name: 'Intro World'
				viewpointName: #DungeonPortal.

	portal := win contents.
	portal postcardLink: pc.
	portal registerGlobal: #IntroPortal.
	space addChild: win.