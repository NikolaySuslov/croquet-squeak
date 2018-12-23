accessing
controllerWithID: id
	^AccessProtect critical:[Registry at: id ifAbsent:[nil]]