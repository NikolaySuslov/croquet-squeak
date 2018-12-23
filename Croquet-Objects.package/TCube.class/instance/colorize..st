accessing
colorize: col

	| mat |
	mat := TMaterial new.
	mat ambientColor: col.
	mat diffuseColor: col.
	mat textureMode: GLModulate.

	self material: mat.
