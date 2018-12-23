initialize
closeRequest
	model ifNil:[^self delete].
	model closeRequest.