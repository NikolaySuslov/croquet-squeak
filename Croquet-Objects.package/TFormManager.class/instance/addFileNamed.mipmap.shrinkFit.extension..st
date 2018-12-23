loading
addFileNamed: fName mipmap: bMM shrinkFit: bSF extension: ext

	| file form tform fileName sha contents |
	"find the file"
	fileName := self findTextureFileName: fName.
	fileName ifNil:[ 
		Transcript show: 'Texture not found-  check the name.', fName;cr.
		fileName := self findTextureFileName: 'default.bmp'.
	].
	file := (FileStream readOnlyFileNamed: fileName)binary.
	contents := file contentsOfEntireFile.
	"compute the sha hash"
	sha := TFormManager generateSHA: contents.
	"load the file into a Form"
	tform := textureDictionary at: sha ifAbsentPut:[
		[
		  form := Form fromBinaryStream: (ReadStream on:contents).
		  form ifNotNil:[
			tform := TForm new initialize: sha form: form 
						mipmap: bMM shrinkFit: bSF extension: ext.
		  ] ifNil:[
			Transcript cr; show:'Bad texture file - cannot load'.
			^ nil.
		  ].
		] ifError: [ :msg | 
			Transcript cr; show:'Ignoring texture file: ', msg.
			^ nil.
		].
		tform.
	].
	"copy the original file into the local cache"
	cacheMgr cache: contents to: sha.
	^tform thumb.