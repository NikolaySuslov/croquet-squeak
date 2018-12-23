driving
forwardOnY: foy

	| v |
	v := localTransform lookSide .
	v := (v cross:(0@1@0))*foy.
	localTransform translation: (self root checkMotion: v forAvatar:self ).
	self pitch abs > 0.001 ifTrue:[self pitch: self pitch * 0.8].
	self roll abs > 0.001 ifTrue:[self roll:0.0].
