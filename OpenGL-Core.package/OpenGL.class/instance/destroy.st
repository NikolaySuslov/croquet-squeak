initialize
destroy
	glExt ifNotNil:[
		glExt ogl: nil.
		glExt := nil].
	self primDestroyRenderer: handle.
	handle := nil.