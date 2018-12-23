accessing
radioOn

" this sets the button holder in radio mode. This means that only one button in its group can be selected at a time. You can retrieve the current selected button via #radioButton."
	radio := true.
	frameChildren ifNotNil:[
		frameChildren doWithIndex:[:bttn :index |
			bttn target: self action: #radio:.
			bttn target2: self action2: #radio:.
			index = 1 ifTrue:[
				bttn switch: true.
				radioButton := bttn.
			].
		].
	].
