as yet unclassified
initialize
	| space light floor floorMesh pic mat tMesh url win pc portal atar |
	Processor activeIsland id: self class islandID.
	space := TSpace new.
	space registerGlobal: #mainEntry.
	space color: (VectorColor r: 0.0 g: 0.45 b: 0.51 a: 1.0).
	space fogOn: true.
	space fogDensity: 0.025.
	space fogStart: 40.0.
	space fogEnd: 200.0.

	light := TLight new.
	light ambientColor: #(0.5 0.5 0.5 1.0).
	light diffuseColor: #(1.0  1.0  1.0  1.0).
	light specularColor: #(0.0 0.0 0.0 1.0).
	light rotationAroundZ: 220.
	light translationX: 0 y: 3 z: -15.
	space addChild: light.

	floor := TTexture new initializeWithFileName: 'floor.bmp' mipmap: true shrinkFit: false.
	floor rotationAroundX: -90.
	floor translationX: 0 y: -2.0 z: -3.0.
	floor uvScale: 8.0@8.0.
	floor extent: 40.0@40.0.

	floorMesh := (FileStream readOnlyFileNamed: (FileDirectory pathFromURI: 'Content/Underwater/topo.mesh')) fileInObjectAndCode.
	pic := TTexture new initializeWithFileName: (FileDirectory pathFromURI: 'Content/Underwater/Waves1.jpg').
	mat := TMaterial new.
	mat ambientColor: #(0.2 0.4 0.3 1).
	mat diffuseColor: #(0.2 0.4 0.3 1).
	mat texture: pic.
	mat textureMode: GLModulate.
	tMesh := TMesh
				initializeWithVertices: floorMesh vertices 
				alias: nil 
				norms: floorMesh vertexNormals
				textureUV: floorMesh texCoords
				faceGroups: {1. floorMesh zeroBasedFaceGroup}
				material: mat.
	tMesh initBounds.
	tMesh solid: true.
	tMesh translationX: 0 y: -76 z: 0.
	tMesh material ambientColor: #(1 1 1 1).
	tMesh material diffuseColor: #(1 1 1 1).
	space addChild: tMesh.

	atar := self makeSomeFish: space target: light.
	space defaultAvatar: (TIslandCopier new export: atar).

	#(
		('Content/Underwater/tutorials/embedded/fishScript/fishScript.html' -10 1 -22 30)
		('Content/Underwater/tutorials/embedded/fishPaint/fishPaint.html' 10 1 -22 -30)
	) do:[:spec|
		url := spec first. "look locally only"
		pic := self makeWebPage: url extent: 512@256.

		win := self makeWindow.
		win translationX: spec second y: spec third z: spec fourth.
		win rotationAroundY: spec fifth.
		win contents: pic.
		space addChild: win.
	].

	win := self makePortal: nil.
	win rotationAroundY: 180.
	win translationX: 0.0 y:0.0 z: 3.0.
	win openContents.
	pc := TPostcard new routerAddress: nil "don't know what it is"
				id: IntroWorld islandID
				name: 'Intro World'
				viewpointName: #UnderwaterPortal.

	portal := win contents.
	portal postcardLink: pc.
	portal registerGlobal: #IntroPortal.
	space addChild: win.
