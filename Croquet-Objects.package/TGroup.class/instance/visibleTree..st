accessing
visibleTree: bool

	"Skip yourself, just do the children."
	frameChildren ifNotNil:[
		frameChildren do:[ :fc | fc visibleTree: bool.].].