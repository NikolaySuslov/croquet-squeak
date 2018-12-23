accessing
colorize: col

	self material ifNil: [self material: TMaterial new].
	self material
				ambientColor: col;
				diffuseColor: col.