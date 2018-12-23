accessing
cullFace: bool

	frameChildren ifNotNil:[frameChildren do:[:fc | fc cullFace: bool]].