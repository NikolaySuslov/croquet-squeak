accessing
persist: bool

	persist := bool.
	persist ifTrue:[ 	
		self color: TButton overColor.
		self enable].
	persist ifFalse:[self disable].