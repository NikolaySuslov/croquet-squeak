copying
postCopy

	super postCopy.
	ambientColor := ambientColor copy.
	diffuseColor := diffuseColor copy.
	specularColor := specularColor copy.
	emissiveColor := emissiveColor copy.
	subMaterialList ifNotNil:[
		subMaterialList := subMaterialList collect:[:mat| mat copy].
	].
	^self