initialize
makeMirror: sp
	| win |
	win := self makePortal: nil.
	win translationX: -1 y:0 z: -8.
	sp addChild: win.
