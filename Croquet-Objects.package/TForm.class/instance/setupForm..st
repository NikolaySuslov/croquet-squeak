initialize
setupForm: baseForm
	| aForm size |
	bThumb := false.
	aForm := baseForm.
	extent := baseForm extent. "before we scale it down"
	aForm depth = 32 ifFalse: [aForm := aForm asFormOfDepth: 32.].
	size := aForm width @ aForm height.
	bShrinkFit
		ifTrue:[size := size asSmallerPowerOfTwo]
		ifFalse: [size := size asLargerPowerOfTwo].
	size = aForm extent ifTrue:[form := aForm]
		ifFalse:[	form := Form extent: size depth: 32.
				aForm displayScaledOn: form].
	extension == #colorKeyZero ifTrue:[form colorKeyZero].
	extension == #colorKey ifTrue:[form colorKeyAlpha].
	extension == nil ifTrue:[form fixAlpha].

	self updateAll.
	self calcMemUsed.
	sha ifNil:[
		sha := TObjectID for: 'TForm setup SHA'. 
		static := false.
	] ifNotNil:[
		static := true
	].
