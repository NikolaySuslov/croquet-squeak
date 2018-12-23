initialize
loadFrame: fileName orCreate: aClass
	"Try to load the dungeon from cache"
	| file island portal reader info label bar |
	info := 'Loading ', fileName.
	label := StringMorph new contents: info.
"	self addMorphFront: label."
"	label position: self position."
	bar := [:aString| label contents: aString. World doOneCycleNow].

	file := [FileStream readOnlyFileNamed: fileName] 
			on: FileDoesNotExistException 
			do:[:ex| ex return: nil].
	file ifNotNil:[
		[
			reader := TIslandReader new.
			reader progressBar: bar.
			reader defaultInfo: info.
			island := [reader readObjectFrom: file] 
				on: Error do:[:ex| ex return: nil].
			island ifNotNil:[
				portal := island portal. 	
			].
		] ensure:[file close].
	].
	portal ifNil:["no cached version - recreate from scratch"
		island := TIsland new.
		island scheduler: (island new: ScriptScheduler).
		island name: aClass name.
		portal := island new: aClass.
		island portal: portal.
		file := FileStream forceNewFileNamed: fileName.
		[	
			self saveIsland: island on: file. 
		] ensure:[
			file close.
		].
	].
	label delete.
	^portal.