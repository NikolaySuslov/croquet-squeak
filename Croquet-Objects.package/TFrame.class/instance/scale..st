transform
scale: scale

	self translation: scale * self translation.
	frameChildren ifNotNil:[
		frameChildren do:[ :fc | fc scale: scale.]].