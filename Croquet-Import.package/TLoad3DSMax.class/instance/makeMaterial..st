parse
makeMaterial: tree

	| fieldName field material ambient diffuse specular shininess alpha txtr  subMaterialList twoSided mapDiffuseField oNameAndForm |

	alpha := 1.0.
	shininess := 50.0.
	material := TMaterial new.
	twoSided := false.
	txtr := nil.

	tree linksDo:[:node |
		fieldName := node name.
		field := node value.

		fieldName = #TMaterialName ifTrue:[material objectName: field.].
		fieldName = #TMaterialClass ifTrue:["unused"].
		fieldName = #TMaterialAmbient ifTrue:[ambient := self makeNumberArray: field.].
		fieldName = #TMaterialDiffuse ifTrue:[diffuse := self makeNumberArray: field].
		fieldName = #TMaterialSpecular ifTrue:[specular := self makeNumberArray: field].
		fieldName = #TMaterialShine ifTrue:[shininess := self makeNumber: field].
		fieldName = #TMaterialShinestrength ifTrue:["unused"].
		fieldName = #TMaterialTransparency ifTrue:[
						alpha := 1.0 - (self makeNumber: field)].
		fieldName = #TMaterialWiresize ifTrue:["unused"].
		fieldName = #TMaterialShading ifTrue:["unused"].
		fieldName = #TMaterialXpFalloff ifTrue:["unused"].
		fieldName = #TMaterialSoften ifTrue:["unused"].
		fieldName = #TMaterialXpType ifTrue:["unused"].
		fieldName = #TMapDiffuse ifTrue:[ mapDiffuseField := field ].
		fieldName = #TMapOpacity ifTrue: [ oNameAndForm := self makeTextureForm: field ].
		fieldName = #TNumsubmtls ifTrue:[ subMaterialList := OrderedCollection new.].
		fieldName = #TSubmaterial ifTrue:[ subMaterialList add: (self makeMaterial:field) ].
		fieldName = #TMaterialTwosided ifTrue:[ twoSided := true. ].
		].

	ambient ifNotNil:[
		ambient add: alpha.
		material ambientColor: ambient.
		].
	diffuse ifNotNil:[
		diffuse add: alpha.
		material diffuseColor: diffuse.
		].
	specular ifNotNil:[
		specular add: 1.0.
		material specularColor: specular.
		].
	material shininess: shininess.

	mapDiffuseField ifNotNil: [
		"Create the surface texture."
		txtr := self makeMap: mapDiffuseField withOpacity: oNameAndForm.
	].

	txtr ifNotNil:[

		material texture: txtr.

		txtr extension = #fullBright 
			ifTrue:[ material textureMode: GLReplace.
					material fullBright: true.
					Transcript show:'FULLBRIGHT';cr.
			]
			ifFalse:[ material textureMode: textureMode.].
		(txtr extension = #colorKey or:[txtr extension = #alpha])
			ifTrue:[material hasAlpha 
					ifFalse:[ 
						material diffuseColor:(material diffuseColor * 0.99)
						]
					].

		material uvAngle: txtr uvAngle.
		material uvOffset: txtr uvOffset.
		material uvScale: txtr uvScale.
		].

	material subMaterialList: subMaterialList.
	twoSided ifTrue:[ material cullFace: false].
	^ material.
