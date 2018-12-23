zoom navigator
clickProjectView: aProject
	| fakeSHA morphic space island worldExtent txtr pos win |
	aProject == Project current ifTrue:[^Smalltalk beep].
	worldExtent := 1024@768.
	space := harness activeSpace.
	island := harness activeIsland.
	fakeSHA := TFormManager generateSHA: (TObjectID for: 'Project SHA').
	morphic := island future new: TMorphicForm.
	morphic future
		initialize: nil sha: fakeSHA 
		form: (Form extent: 32@32 depth: 32)
		mipmap: false shrinkFit: true extension: nil. 
	morphic future bThumb: true.
	morphic future worldExtent: worldExtent.
	morphic future constructor: (MessageSend
		receiver: MorphicWorldHost
		selector: #makeProjectLink:extent:from:
		argument: aProject name).

	txtr := island future new: TTextureHackForm.
	txtr future initializeWithTForm: morphic.
	txtr future targetExtent: worldExtent.

	win := self makeWindowIn: island.
	win future contents: txtr.

	"Position it"
	pos := harness avatar translation - (harness avatar lookAt * 10).
	win future translation: pos.
	win future rotationAroundY: harness avatar yaw.
	space future addChild: win.
