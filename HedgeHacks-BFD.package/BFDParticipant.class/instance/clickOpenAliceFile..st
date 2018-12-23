3d sketch
clickOpenAliceFile: filePath
	| fName frame imported pos camera |
true ifTrue:[
	^harness avatar loadAvatar: filePath.
].
	"Import TFrame (non-replicated)"
	fName := FileDirectory pathFromURI: filePath.
	Cursor read showWhile:[
		imported := TLoadMDL new parseFileNamed: fName.
	].
	"Copy resulting frame into island"
	Cursor wait showWhile:[
		| copier dstIsland conn |
		dstIsland := harness activeIsland.
		conn := (dstIsland send:[:x|  x controller]) connection.
		conn sendAmount: 0.
		conn sendCount: 0.
		copier := TIslandCopier new.
		MessageTally spyOn:[frame := copier copy: imported to: dstIsland].
		Transcript cr show: 'Messages sent: ', conn sendCount printString.
		Transcript cr show: 'Data sent: ', conn sendAmount printString.
	].
	camera := harness camera.
	pos := camera "avatar" translation - (camera "avatar" lookAt * 10).
	frame future translation: pos.
	harness activeSpace future addChild: frame.
