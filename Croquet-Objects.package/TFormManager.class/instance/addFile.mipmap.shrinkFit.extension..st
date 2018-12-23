loading
addFile: file mipmap: bMM shrinkFit: bSF extension: ext
	"This is the guts of #addFileNamed:mipmap:shrinkFit:extention:.
	In my opinion, this is preferred interface, because it ought to be safe for any
	API to do operations with an already opened file. Only 'safe' operations (e.g.,
	those explicitly given permission by the user, or those that nag the user, should be allowed
	to open a file on my machine. Besides, the other method could be rewritten to use this one."
	| form tform sha contents |
	contents := file binary contentsOfEntireFile.
	"compute the sha hash"
	sha := TFormManager generateSHA: contents.
	"load the file into a Form"
	tform := textureDictionary at: sha ifAbsentPut:[
		form := Form fromBinaryStream: (ReadStream on:contents).
		form ifNotNil:[
			tform := TForm new 
							initializeSHA: sha 
							form: form 
							mipmap: bMM 
							shrinkFit: bSF 
							extension: ext 
							url: nil.
		] ifNil:[
			Transcript show:'Bad texture file - cannot load';cr.
			^ nil.
		].
		tform.
	].
	"copy the original file into the local cache"
	cacheMgr cache: contents to: sha.
	^tform thumb.