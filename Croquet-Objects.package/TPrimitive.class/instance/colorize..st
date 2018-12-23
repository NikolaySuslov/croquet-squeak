accessing
colorize: col

	| mat |
	mat := TMaterial new.
	mat ambientColor: col.
	mat diffuseColor: col.
	mat textureMode: GLModulate.

	material ifNotNil:[
		mat emissiveColor: material emissiveColor.
		mat specularColor: material specularColor.
		mat shininess: material shininess.
		mat texture: material texture.
		].
	self material: mat.
