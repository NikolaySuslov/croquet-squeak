parsing
parseMtlFile: fileName

	| fileStream tokens currentMaterial localDir file |
	fileStream := (CrLfFileStream readOnlyFileNamed: fileName) ascii.
	localDir := fileStream directory pathName.

	[ fileStream atEnd ] whileFalse: [
		tokens := fileStream nextLine findTokens: Character separators.
		tokens isEmpty ifFalse: [
			tokens first asSymbol caseOf: {
				[ #newmtl ] -> [ "New Material"
					tokens second ifNotNilDo: [:name |
						currentMaterial := materials at: name ifAbsentPut: TMaterial new.
					].
				].

				[ #Ns ] -> [ "Shininess"
					currentMaterial shininess: tokens second asNumber asFloat.
				].

				[ #Ka ] -> [ "Ambient Color"
					currentMaterial ambientColor: (self makeColor: tokens).
				].

				[ #Kd ] -> [ "Diffuse Color"
					currentMaterial diffuseColor: (self makeColor: tokens).
				].

				[ #Ks ] -> [ "Specular Color"
					currentMaterial specularColor: (self makeColor: tokens).
				].

				[ #'map_Kd' ] -> [ "Texture Map"
					file := FileDirectory pathFrom: {localDir. tokens last}.
					currentMaterial texture: (self loadTexture: file).
				].
					
			} otherwise: [].
		].
	].