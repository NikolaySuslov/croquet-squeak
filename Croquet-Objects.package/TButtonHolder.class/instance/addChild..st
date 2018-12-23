accessing
addChild: bttn

	| size box scale |
	box := bttn boundingBox.
	scale := 0.8*buttonWidth/(box extentMax).
	bttn scale: scale.

	super addChild: bttn.
	size := (frameChildren size)sqrt*buttonWidth.
	self extent: (size@size).
	radio ifTrue:[
		bttn target: self action: #radio:.
		bttn target2: self action2: #radio:.
		frameChildren size = 1 ifTrue:[
			bttn switch: true.
			radioButton := bttn.
		].
	].