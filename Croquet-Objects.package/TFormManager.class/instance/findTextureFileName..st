loading
findTextureFileName: fName
	| path dir file pn paths files |
	"the following attempts to handle case issues in the various texture file names on Linux for now."
	" Generate a list in paths of ways that people have spelled file and directory names.
	Pending reorganization of the Contents directory!"
	pn := FileDirectory default.
	paths := OrderedCollection new.
	path := FileDirectory default fullNameFor: fName.
	dir := FileDirectory on: (FileDirectory dirPathFor: path).
	file := FileDirectory localNameFor: path.
	"three forms of the file name: FooBar, foobar and Foobar"
	files := OrderedCollection new.
	files add: file.
	files add: (file := file asLowercase).
	files add: file capitalized.
	"look in file's directory first"
	paths := files collect: [ :fn |
			dir pathFromURI: fn].
	"look in textures subdirectory second"
	#('Textures/' 'textures/') do: [ :casedName |
		paths := paths, (files collect: [ :fn |
			dir pathFromURI: casedName, fn]).
		].
	"if fName has no prefix, look in default Textures directories"
	(FileDirectory dirPathFor: fName) isEmpty ifTrue: [
		#('Textures/' 'textures/') do: [ :casedName |
			paths := paths, (files collect: [ :fn | 
				pn pathFromURI: casedName, fn])].
		#('Content/' 'content/') do: [ :casedDir |
			#('Textures/' 'textures/') do: [ :casedName |
				paths := paths, (files collect: [ :fn |
					pn pathFromURI: casedDir, casedName, fn])]].
		].

    "Also search in top-level Content/Textures directory"
    #('Textures/' 'textures/') do: [ :casedName |
		paths := paths, (files collect: [ :fn |
			pn pathFromURI: 'Content/', casedName, fn]).
		].
   
    "Also search in top-level Textures directory"
    #('Textures/' 'textures/') do: [ :casedName |
		paths := paths, (files collect: [ :fn |
			pn pathFromURI: casedName, fn]).
		].

	"Now search all the paths we constructed"
	paths do: [ :filePath | (FileStream isAFileNamed: filePath) ifTrue:[^filePath] ].
	^ nil.
"	CroquetData logError: 'Substituting default texture for missing texture file: : ', fName.
	^pn pathFromURI: 'Content/Textures/default.bmp'."