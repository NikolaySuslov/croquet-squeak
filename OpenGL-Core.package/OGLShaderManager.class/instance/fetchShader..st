as yet unclassified
fetchShader: shaderName
	^ programObjects at: shaderName ifAbsent: [ nil ].