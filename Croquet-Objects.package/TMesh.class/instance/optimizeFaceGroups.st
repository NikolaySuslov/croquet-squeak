initialize
optimizeFaceGroups
	"Optimize the face groups to minimize state changes"
	| matList faces index |
	matList := IdentityDictionary new.
	1 to: faceGroups size by: 2 do:[:i|
		index := faceGroups at: i.
		faces := faceGroups at: i+1.
		matList at: index put: ((matList at: index ifAbsent:[#()]) copyWith: faces).
	].
	index := 0.
	matList keysAndValuesDo:[:mIndex :fList|
		fList do:[:fGroup|
			faceGroups at: (index := index+1) put: mIndex.
			faceGroups at: (index := index+1) put: fGroup.
		].
	].
	faceBuffers := ((2 to: faceGroups size by: 2) collect: [:ind | (faceGroups at: ind)]).