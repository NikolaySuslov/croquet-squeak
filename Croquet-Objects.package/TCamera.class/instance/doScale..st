transform
doScale: scale

	frameChildren ifNotNil:[
		frameChildren do:[ :fc | fc scale: scale.]].
