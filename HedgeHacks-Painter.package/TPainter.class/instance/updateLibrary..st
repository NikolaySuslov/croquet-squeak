library
updateLibrary: sketchList
	| dir extensions files file holder |
	dir := self libraryDirectory.
	extensions := #('.gif' '.bmp' '.jpg' '.png').
	files := dir fileNames select:[:fName|
				extensions anySatisfy:[:ext| fName endsWith: ext].
	].
	files := files sort.
	files do:[:fName|
		file := dir readOnlyFileNamed: fName.
		[holder := self makeLibraryButtonFrom: file] ensure:[file close].
		sketchList addMorphBack: holder.
		"self waitTick."
	].