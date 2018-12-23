accessing
colorize: col

	"Apply this color to all children of the group."

	frameChildren ifNotNil:[frameChildren do:[ :fc | fc colorize: col].].