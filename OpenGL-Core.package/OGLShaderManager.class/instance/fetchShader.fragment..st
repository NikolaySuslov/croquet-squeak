as yet unclassified
fetchShader: vertexShaderPath fragment: fragmentShaderPath
	^ programObjects at: (vertexShaderPath, fragmentShaderPath) ifAbsent: [ nil ].