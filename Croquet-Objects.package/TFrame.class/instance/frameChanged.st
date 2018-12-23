accessing
frameChanged

	" This guarantees that if we make a change in a parent frame, all of the children are aware and can deal with it properly."
	frameChanged := true.
	frameChildren ifNotNil:[
		frameChildren do:[ :child | child frameChanged ].].
	myProperties ifNotNil:[self signal: #frameChanged]. "to inform interested parties"
