accessing
doRadio: bttn

	frameChildren do:[:fc |
		fc switch:fc = bttn.
		fc switch ifTrue:[self radioButton: fc].
		].