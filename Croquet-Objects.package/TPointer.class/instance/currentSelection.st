accessing
currentSelection 

	focusSelected ifNil:[^selection].
	^focusSelected = selection frame ifTrue:[selection] ifFalse:[lastSelection].