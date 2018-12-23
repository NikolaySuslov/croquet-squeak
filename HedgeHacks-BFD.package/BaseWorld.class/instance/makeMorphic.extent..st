toys
makeMorphic: constructor extent: worldExtent
	| morphic txtr fakeSHA |
	fakeSHA := TFormManager generateSHA: (TObjectID for: 'SHA').
	morphic := TMorphicForm new 
		initialize: nil sha: fakeSHA 
		form: (Form extent: 32@32 depth: 32)
		mipmap: false shrinkFit: true extension: nil. 
	morphic bThumb: true.
	morphic constructor: constructor.
	morphic worldExtent: worldExtent.

	"@@@@ The following is VERY important since later we'll need the TMorphic's farRef but we cannot create it in render, so forcing it here is a must @@@@"
	morphic island asFarRef: morphic.

	txtr := TTextureHackForm new initializeWithTForm: morphic.
	txtr targetExtent: worldExtent.
	^txtr