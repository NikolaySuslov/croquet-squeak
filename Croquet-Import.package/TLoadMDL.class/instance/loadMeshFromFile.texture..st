parsing
loadMeshFromFile: meshFile texture: textureName
	"Load this object's mesh from the specified file"
	| words texture |
	textureName ifNotNil:[
		texture := textures at: textureName 
			ifAbsentPut:[TTexture new initializeWithFileName: textureName].
	].
	meshFile ifNil:[^nil].
	words := (meshFile findTokens: '.').
	((words last) = 'vfb') 
		ifTrue: [^self parseVFBFile: meshFile texture: texture].

	((words last) = 'obj') 
		ifTrue: [^self parseOBJFile: meshFile texture: texture].
	^nil