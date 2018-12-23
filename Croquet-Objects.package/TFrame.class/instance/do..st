accessing
do: block

	block value: self.
	frameChildren ifNotNil:[ 
		frameChildren do:[ :fc | fc do: block].].
