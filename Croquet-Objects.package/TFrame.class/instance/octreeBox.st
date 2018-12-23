accessing
octreeBox
	| box childBox bs |

	box := TBox new.
	frameChildren ifNotNil:[
		frameChildren do:[ :fc | 	
			childBox := fc octreeBox.
			childBox ifNotNil:[
				box := box unionBox: childBox.].
			].
		].
	bs := self boundSphere.
	bs ifNotNil:[
		bs transform: self globalTransform.
		box growVertex: bs globalPosition.
		].
	box min x > box max x ifTrue:[^ nil ].
	^ box.