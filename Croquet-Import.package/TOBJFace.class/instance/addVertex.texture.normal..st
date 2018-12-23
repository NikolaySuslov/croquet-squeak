accessing
addVertex: vtx texture: txt normal: nrml
	vertexIndices add: vtx asNumber.
	txt ifNotNil: [ textureUVIndices add: txt asNumber ].
	nrml ifNotNil: [ normalIndices add: nrml asNumber ].