printing
printOn: aStream 

	super printOn: aStream. 
	texture ifNotNil:[
		aStream nextPut: $[. 
		texture printOn: aStream.
		aStream nextPut: $].
	].
	subMaterialList ifNotNil:[ 
		aStream nextPut:$[.
		subMaterialList printOn: aStream.
		aStream nextPut: $].
	].
