parsing
parseStream: fileStream

	| face localDir txt useMaterial tokens currentMaterial |
	localDir := fileStream directory pathName.

	" Loop through each line of the file. "
	[ fileStream atEnd ] whileFalse: [
		tokens := fileStream nextLine findTokens: Character separators.
		tokens isEmpty ifFalse: [
			tokens first asSymbol caseOf: {
				[ #v ] -> [ "Vertex"
					self makeVertex: tokens.
				].

				[ #vn ] -> [ "Vertex Normals"
					self makeNormal: tokens.
				].

				[ #vt ] -> [ "Texture Coordinates"
					self makeTextureUV: tokens.
				].

				[ #g ] -> [ "Group"
					"Ignoring for now"
				].

				[ #mtllib ] -> [ "Material Library"
					self parseMtlFile: (FileDirectory pathFrom: {localDir. tokens second}).
				].

				[ #usemtl ] -> [ "Use Material"
					useMaterial := tokens second.
				].

				[ #usemap ] -> [ "Use Texture Map"
					txt := self loadTexture: (FileDirectory pathFrom: {localDir. tokens second}).
					currentMaterial := materials at: useMaterial ifAbsentPut: [ TMaterial new ].
					currentMaterial ifNotNilDo: [:mat | mat texture: txt].
				].

				[ #f ] -> [ "Face"
					face := self makeFace: tokens.
					useMaterial ifNotNilDo: [:m | face materialName: m].
					faces add: face.
				].
			} otherwise: [].
		].
	].

	self triangulateFaces.

	" Print some info. "
	true ifTrue: [
		Transcript show: 'Vertices read: ', vertices size; cr.
		Transcript show: 'Normals read: ', normals size; cr.
		Transcript show: 'TextureUV read: ', textureUV size; cr.
		Transcript show: 'Faces read: ', faces size; cr.
	].