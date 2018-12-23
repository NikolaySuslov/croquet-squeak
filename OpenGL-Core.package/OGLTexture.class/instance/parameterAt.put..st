accessing
parameterAt: pname put: param
	(parameters ifNil: [parameters := Dictionary new])
		at: pname put: param