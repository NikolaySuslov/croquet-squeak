accessing
color: col

	color := col copy.
	color at: 4 put: 0.2.

	glowMaterial ambientColor: color.
	glowMaterial diffuseColor: color.
	glowPointMaterial ambientColor: color.
	glowPointMaterial diffuseColor: color.

	shaft material: glowMaterial.
	point material: glowPointMaterial.

	