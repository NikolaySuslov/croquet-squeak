initialize
loadAvatar: avatarPath
	| box scale dy newModel newHead |
	newModel := TLoadMDL new parseFileNamed: (FileDirectory pathFromURI: avatarPath).
	newModel ifNil:[^nil].
	box := newModel boundingBox.
	scale := 4.708164/box extentY.
	dy := box centerY * scale negated.
	newModel scale: scale.
	box := newModel boundingBox.
	newModel translationX: 0 y: 0.616526961326599+dy-2.3 z: 0.
	newModel solidTree: false.
	newModel frameChildrenDo:[:child |
		(child objectName = 'head' or: [ child objectName = 'neck' ]) ifTrue: [
				newHead := child.
		]
	].
	modelData := TIslandCopier new export: (Array with: newModel with: newHead).
	self installModelData.