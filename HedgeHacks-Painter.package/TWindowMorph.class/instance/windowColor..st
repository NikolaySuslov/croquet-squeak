accessing
windowColor: aColor
	| frameColor |
	windowColor := aColor.
	frame windowColor: windowColor.
	frameColor := (Color white mixed: 0.4 with: windowColor).
	self adoptPaneColor: (Color white mixed: 0.7 with: windowColor).
	self borderStyle baseColor: frameColor.
	content submorphsDo:[:m|
		m borderWidth > 0 ifTrue:[m borderStyle baseColor: frameColor].
	].