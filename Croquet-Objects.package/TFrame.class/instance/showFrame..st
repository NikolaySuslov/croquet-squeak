accessing
showFrame: depth

	1 to: depth do:[ :i | Transcript show:'---|'].
	Transcript show: self objectName; cr.
	self frameChildren ifNotNil:[
		frameChildren do:[ : fc |
			fc showFrame: depth+1.].].